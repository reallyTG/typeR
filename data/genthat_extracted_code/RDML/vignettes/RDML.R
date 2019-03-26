## ---- echo = FALSE, message = FALSE--------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
library(kfigr)
library(RDML)

## ---- results = "hide"---------------------------------------------------
filename <- system.file("extdata/lc96_bACTXY.rdml", package = "RDML")
lc96 <- RDML$new(filename = filename)

## ------------------------------------------------------------------------
lc96

## ------------------------------------------------------------------------
fdata <- 
  lc96$
    experiment$`ca1eb225-ecea-4793-9804-87bfbb45f81d`$
    run$`65aeb1ec-b377-4ef6-b03f-92898d47488b`$
    react$`45`$
    data$bACT$
    adp$fpoints #'adp' means amplification data points (qPCR)
head(fdata)

## ----dendrogram, anchor="figure", results = "hide", fig.width = 6, fig.height = 4----
lc96$AsDendrogram()

## ------------------------------------------------------------------------
ref <- lc96$
          experiment$`ca1eb225-ecea-4793-9804-87bfbb45f81d`$
          run$`65aeb1ec-b377-4ef6-b03f-92898d47488b`$
          react$`39`$
          sample$id
sample <- lc96$sample[[ref]]
sample$quantity$value

## ------------------------------------------------------------------------
id1 <- idType$new("id_1")
id2 <- id1
id3 <- id1$copy()
id2$id <- "id_2"
id3$id <- "id_3"
cat(sprintf("Original object\t\t: %s ('id_1' became 'id_2')\nSimple copy\t\t\t: %s\n'Real' copy (clone)\t: %s\n",
            id1$id, id2$id, id3$id))

## ------------------------------------------------------------------------
## Create 'real' copy of object
experiment <- lc96$experiment$`ca1eb225-ecea-4793-9804-87bfbb45f81d`$copy()
## Try to set 'id' with wrong input type.
## Correct type 'idType' can be seen at error message.
tryCatch(experiment$id <- "exp1",
         error = function(e) print(e))

## Set 'id' with correct input type - 'idType'
experiment$id <- idType$new("exp1")

## Similar operations for 'run'
run <- experiment$run$`65aeb1ec-b377-4ef6-b03f-92898d47488b`$copy()
run$id <- idType$new("run1")

## Replace original elements with modified
experiment$run <- list(run)
lc96$experiment <- list(experiment)

## ----dendrogram_modified, anchor = "figure", results = "hide", fig.width = 6, fig.height = 4----
lc96$AsDendrogram()

## ------------------------------------------------------------------------
tab <- lc96$AsTable(
  # Custom name pattern 'position~sample~sample.type~target~dye'
  name.pattern = paste(
             react$position,
             react$sample$id,
             private$.sample[[react$sample$id]]$type$value,
             data$tar$id,
             target[[data$tar$id]]$dyeId$id,
             sep = "~"),
  # Custom column 'quantity' - starting quantity of added sample 
  quantity = {
    value  <- sample[[react$sample$id]]$quantity$value
    if (is.null(value) || is.na(value)) NULL
    else value
  }
)
## Remove row names for compact printing
rownames(tab) <- NULL
head(tab)

## ---- results = "hide", messages = FALSE, fig.width = 6, fig.height = 4----
library(dplyr)
library(ggplot2)

## Prepare request to get only 'std' type samples
filtered.tab <- filter(tab,
                       sample.type == "std")

fdata <- lc96$GetFData(filtered.tab,
                       # long table format for usage with ggplot2
                       long.table = TRUE)
ggplot(fdata, aes(cyc, fluor)) +
    geom_line(aes(group = fdata.name,
                  color = target))

## ------------------------------------------------------------------------
library(chipPCR)
tab <- lc96$AsTable(
  # Custom name pattern 'position~sample~sample.type~target~run.id'
  name.pattern = paste(
             react$position,
             react$sample$id,
             private$.sample[[react$sample$id]]$type$value,
             data$tar$id,
             run$id$id, # run id added to names
             sep = "~"))
## Get all fluorescence data
fdata <- as.data.frame(lc96$GetFData(tab,
                                     # We don't need long table format for CPP()
                                     long.table = FALSE))

fdata.cpp <- cbind(cyc = fdata[, 1],
                   apply(fdata[, -1], 2,
                         function(x) CPP(fdata[, 1],
                                         x)$y))

## ---- fig.width = 6, fig.height = 4--------------------------------------
tab$run.id <- "run.cpp"
## Set fluorescence data from previous section
lc96$SetFData(fdata.cpp,
              tab)

## View setted data
fdata <- lc96$GetFData(tab,
                       long.table = TRUE)
ggplot(fdata, aes(cyc, fluor)) +
    geom_line(aes(group = fdata.name,
                  color = target))

## ---- results = "hide", fig.width = 7, fig.height = 6--------------------
## Load another built in RDML file
stepone <- RDML$new(paste0(path.package("RDML"),
                           "/extdata/", "stepone_std.rdml"))
## Merge it with our 'lc96' object
merged <- MergeRDMLs(list(lc96, stepone))
## View structure of new object
merged$AsDendrogram()

## ---- results = "hide"---------------------------------------------------
RDML$set("public", "CalcCq",
         function() {
           library(chipPCR)
           fdata <- as.data.frame(self$GetFData(
             self$AsTable()))
           fdata <- cbind(cyc = fdata[, 1],
                          apply(fdata[, -1],
                                2,
                                function(x)
                                  # Data preprocessing
                                  CPP(fdata[, 1],
                                      x)$y)
                          )
           
           apply(fdata[, -1], 2,
                 function(x) {
                   tryCatch(
                     # Calculate Cq
                     th.cyc(fdata[, 1], x,
                            auto = TRUE)@.Data[1],
                     error = function(e) NA)
                 })
         }
)

## Create new object with our advanced class
stepone <- RDML$new(paste0(path.package("RDML"),
                           "/extdata/", "stepone_std.rdml"))

## ------------------------------------------------------------------------
stepone$CalcCq()

## ---- fig.width = 6, fig.height = 3, results = "hide"--------------------
#### Create simulated data with AmpSim() from chipPCR package
## Cq for data to be generated
Cqs <- c(15, 17, 19, 21)
## PCR si,ulation will be 35 cycles
fdata <- data.frame(cyc = 1:35)
for(Cq in Cqs) {
  fdata <- cbind(fdata,
                 AmpSim(cyc = 1:35, Cq = Cq)[, 2])
}
## Set names for fluorescence curves
colnames(fdata)[2:5] <- c("c1", "c2", "c3", "c4")

## Create minimal description
descr <- data.frame(
  fdata.name = c("c1", "c2", "c3", "c4"),
  exp.id = c("exp1", "exp1", "exp1", "exp1"),
  run.id = c("run1", "run1", "run1", "run1"),
  react.id = c(1, 1, 2, 2),
  sample = c("s1", "s1", "s2", "s2"),
  sample.type = c("unkn", "unkn", "unkn", "unkn"),
  target = c("gene1", "gene2", "gene1", "gene2"),
  target.dyeId = c("FAM", "ROX", "FAM", "ROX"),
  stringsAsFactors = FALSE
)

## Create empty RDML object
sim <- RDML$new()
## Add fluorescence data
sim$SetFData(fdata, descr)

## Observe object
sim$AsDendrogram()
fdata <- sim$GetFData(sim$AsTable(),
                      long.table = TRUE)
ggplot(fdata, aes(cyc, fluor)) +
  geom_line(aes(group = fdata.name,
                color = target,
                linetype = sample))

## ---- fig.width = 6, fig.height = 3, results = "hide", warning = FALSE----
filename <- system.file("extdata/from_abi7500/sce.eds", package = "RDML")
abi <- RDML$new(filename = filename)
abi$AsDendrogram()

## ---- fig.width = 6, fig.height = 3, results = "hide"--------------------
filename <- system.file("extdata/from_tables/fdata.csv", package = "RDML")
csv <- RDML$new(filename = filename)
csv$AsDendrogram()

## ---- fig.width = 6, fig.height = 3, results = "hide"--------------------
filename <- system.file("extdata/from_tables/table.xlsx", package = "RDML")
xslx <- RDML$new(filename = filename)
xslx$AsDendrogram()

## ---- echo = FALSE, message = FALSE--------------------------------------
knitr::opts_chunk$set(collapse = T, comment = "#>")

## ---- message = FALSE----------------------------------------------------
library(RDML)
library(chipPCR)
library(MBmca)
library(ggplot2)
data(C54)

## ------------------------------------------------------------------------
str(C54)

## ----warning=FALSE, fig.width = 6, fig.height = 4------------------------

dat <- data.frame(Cycle = rep(C54[, 1], ncol(C54) - 1),
                  Experiment = unlist(lapply(colnames(C54)[-1], function(i) rep(i, nrow(C54)))),
                  refMFi = unlist(C54[, -1]))
levels(dat[["Experiment"]]) <- c("D1 - Stock cDNA", "D2 - 1/10 cDNA", "D3 - 1/100 cDNA")

ggplot(dat, aes(x = Cycle, y = refMFi, colour = Experiment)) + geom_point()

## ------------------------------------------------------------------------
RDML$set("public", "ProcessVideoScan",
         function(last.cycle,
                  bg.range) {
           # Get curves description
           tab <- as.data.frame(self$AsTable())
           # Get fluorescent point
           dat <- as.data.frame(self$GetFData(tab))
           # Give new names to runs
           # Preprocess amplification curve raw data as described in 
           # R&ouml;diger et al. (2015) Bioinformatics. Note that the dataset
           # has different length of cycle numbers and missing values (NAs).
           # The CPP function from the chipPCR package prepares the data for 
           # further analysis.
           tab[, "run.id"] <- paste0(tab[, "run.id"], "_CPP")
           
           # Curves will be used one by one
           for(i in 2:length(dat)) {
             # Preprocess data
             preprocessed <- CPP(dat[1:last.cycle[i - 1], 1], 
                                 dat[1:last.cycle[i - 1], i],
                                 trans = TRUE,
                                 bg.range = bg.range[[i - 1]])[["y.norm"]]
             # Create data.frame with cycle number and preprocessed curve Then
             # give name to fluorescence points columns as before preprocessing
             dat_CPP <- cbind(dat[1:last.cycle[i - 1], 1],
                              preprocessed)
             colnames(dat_CPP)[2] <- tab$fdata.name[i - 1]
             # Set preprocessed data with new description (new run names)
             self$SetFData(dat_CPP, tab)
             # Calculate and set Cq
             # Set Cq from second derivative maximum method as described in 
             # R&ouml;diger et al. (2015) Bioinformatics for preprocessed data.
             # The diffQ2 function from the MBmca package 
             # (R&ouml;diger et al. (2013), The R Journal) was used to calculate the
             # Cq values of each amplification curve.
             cq <- diffQ2(dat_CPP, inder = TRUE)[["xTm1.2.D2"]][1]
             self$experiment[[tab[i - 1, "exp.id"]]]$
               run[[tab[i - 1, "run.id"]]]$
               react[[tab[i - 1, "react.id"]]]$
               data[[tab[i - 1, "target"]]]$cq <- cq
           }
         }, overwrite = TRUE
)

## ------------------------------------------------------------------------
# Create a data frame of metadata 
description <- data.frame(
  fdata.name = c("D1", "D2", "D3"),
  exp.id = c("exp1", "exp1", "exp1"),
  run.id = c("run1", "run2", "run3"),
  react.id = c(1, 1, 1),
  sample = c("D1 - Stock cDNA", "D2 - 1/10 cDNA", "D3 - 1/100 cDNA"),
  sample.type = c("unkn", "unkn", "unkn"),
  target = c("MLC-2v", "MLC-2v", "MLC-2v"),
  target.dyeId = c("Cy5", "Cy5", "Cy5"),
  stringsAsFactors = FALSE
)

# Create an empty RDML object
video.scan <- RDML$new()

# Add fluorescence data and metadata to the RDML object from a given source.
# For the sake of simplicity we use the C54 dataset from the chipPCR package.
video.scan$SetFData(C54, description)

## ------------------------------------------------------------------------
# Add experimentalist information
video.scan$experimenter <- 
  list(
    experimenterType$new(
      idType$new("SR"),
      "Stefan",
      "Roediger",
      "stefan.roediger@b-tu.de"
    ),
    experimenterType$new(
      idType$new("CD"),
      "Claudia",
      "Deutschmann"
    )
  )

# Add a reference to documentation
video.scan$documentation <- list(
  documentationType$new(
    idType$new("Roediger et al. 2013"),
    paste("A Highly Versatile Microscope Imaging Technology Platform for the Multiplex",
          "Real-Time Detection of Biomolecules and Autoimmune Antibodies. S. Roediger,",
          "P. Schierack, A. Boehm, J. Nitschke, I. Berger, U. Froemmel, C. Schmidt, M.",
          "Ruhland, I. Schimke, D. Roggenbuck, W. Lehmann and C. Schroeder. Advances in",
          "Biochemical Bioengineering/Biotechnology. 133:33-74, 2013.",
          "https://www.ncbi.nlm.nih.gov/pubmed/22437246")
  )
)

cdna <- 
  cdnaSynthesisMethodType$new(
    enzyme = "SuperScript II",
    primingMethod =
      primingMethodType$new("oligo-dt"),
    dnaseTreatment = TRUE
  )
video.scan$sample$`D1 - Stock cDNA`$description <- "Input stock cDNA was used undiluted (D1)"
video.scan$sample$`D1 - Stock cDNA`$cdnaSynthesisMethod <- cdna
video.scan$sample$`D2 - 1/10 cDNA`$description <- "1/1000 diluted in A. bidest"
video.scan$sample$`D2 - 1/10 cDNA`$cdnaSynthesisMethod <- cdna
video.scan$sample$`D3 - 1/100 cDNA`$description <- "1/1000000 diluted in A. bidest"
video.scan$sample$`D3 - 1/100 cDNA`$cdnaSynthesisMethod <- cdna

video.scan$target$`MLC-2v`$xRef <- list(
  xRefType$new("uniprot",
               "P10916")
)
video.scan$target$`MLC-2v`$sequences <- 
  sequencesType$new(
    forwardPrimer <- oligoType$new(
      sequence = "ACAGGGATGGCTTCATTGAC"),
    reversePrimer <- oligoType$new(
      sequence = "ATGCGTTGAGAATGGTTTCC"),
    probe1 <- oligoType$new(
      threePrimeTag = "Atto647N",
      sequence = "CAGGGTCCGCTCCCTTAAGTTTCTCC",
      fivePrimeTag = "BHQ2")
  )

tcc <- 
  thermalCyclingConditionsType$new(
    idType$new("Amplification"),
    experimenter = list(
      idReferencesType$new("SR"),
      idReferencesType$new("CD")
    ),
    step = 
      list(
        stepType$new(
          nr = 1,
          temperature = temperatureType$new(95,
                                            600)
        ),
        stepType$new(
          nr = 2,
          temperature = temperatureType$new(95,
                                            40)
        ),
        stepType$new(
          nr = 3,
          temperature = temperatureType$new(58.5,
                                            90)
        ),
        stepType$new(
          nr = 4,
          temperature = temperatureType$new(68.5,
                                            90)
        ),
        stepType$new(
          nr = 5,
          loop = loopType$new(goto = 2,
                              repeat.n = 49)
        )
      )
  )
video.scan$thermalCyclingConditions <- list(
  tcc
)

#add description of the experiment
video.scan$experiment$exp1$description <- 
  paste("The aim was to amplify MLC-2v in the VideoScan and to monitor with a",
        "hydrolysis probe for MLC-2v. The primer sequences for MLC-2v were taken",
        "from Roediger et al. (2013). The amplification was detected in solution of",
        "the 1 HCU (see Roediger et al. 2013 for details). A 20 micro L PCR reaction",
        "was composed of 250 nM primer (forward and reverse), 1x Maxima Probe qPCR",
        "Master Mix (Fermentas), 1 micro L template (MLC-2v amplification product in",
        "different dilutions), 50 nM hydrolysis probe for MLC-2v and A.",
        "bidest. During the amplification, fluorescence was measured at 59.5 degree",
        "Celsius. The Cy5 channel was used to monitor the MLC-2v specific hydrolysis",
        "probe. Input stock cDNA was used undiluted (D1). D2 was 1/1000 and D3",
        "1/1000000 diluted in A. bidest. The D1, D2, and D3 have different numbers",
        "measure points and D2 contains a missing value at cycle 37.")
video.scan$experiment$exp1$run$run1$thermalCyclingConditions <- idReferencesType$new("Amplification")
video.scan$experiment$exp1$run$run2$thermalCyclingConditions <- idReferencesType$new("Amplification")
video.scan$experiment$exp1$run$run3$thermalCyclingConditions <- idReferencesType$new("Amplification")

## ---- message = FALSE----------------------------------------------------
# Process VideoScan data
video.scan$ProcessVideoScan(last.cycle = c(35, 45, 55),
                            bg.range = list(c(1,8),
                                            NULL,
                                            NULL))

## ---- results = "hide", fig.width = 6, fig.height = 4--------------------
# Visualize RDML object
video.scan$AsDendrogram()

## ---- results = "hide", fig.width = 6, fig.height = 4--------------------
## Visualise preprocessed data with Cq values as vertical dashed lines
# Add custom column that contains the calculated Cq
tab <- video.scan$AsTable(
  cq = {
    cq <- data$cq
    if (is.null(cq) || is.na(cq))
      NULL
    else
      cq
  })
# Get preprocessed data in 'long.table' format
dat <- video.scan$GetFData(tab[grepl("_CPP", tab[["run.id"]]), ],
                           long.table = TRUE)
ggplot(dat, aes(x = cyc, y = fluor)) +
  geom_line(aes(group = fdata.name, color = fdata.name),
            size = 1.2) +
  geom_vline(aes(xintercept = cq, color = fdata.name),
             linetype = "longdash") +
  scale_x_continuous("Cycle") +
  scale_y_continuous("Fluorescence") +
  ggtitle("Amplification of human MLC-2v\nVideoScan HCU")

## ---- fig.width = 6, fig.height = 3, echo = FALSE------------------------
bench_df <- read.csv("bench_df.csv")

ggplot(bench_df, aes(x = nr, y = mean, colour = os)) +
  geom_point(size = 3, alpha = 0.5) +
  scale_x_continuous("Number of experiments") +
  scale_y_continuous("Median time [s]") +
  scale_color_discrete("Operating\nsystem") +
  ggtitle("Results of benchmark")

knitr::kable(bench_df[, c("nr", "median", "os")], format = "pandoc",
             col.names = c("Number of experiments", "Median time [s]", "Operating System"),
             caption = "Results of benchmark.")

