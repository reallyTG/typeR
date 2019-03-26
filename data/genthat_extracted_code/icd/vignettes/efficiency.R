## ----setup, echo=FALSE, message=FALSE, warning=FALSE, cache=FALSE--------
library("icd")
requireNamespace("knitr")
fig.width = 6.5
fig.height = fig.width / ((1 + sqrt(5)) / 2)
bitmap_dpi = 600
knitr::opts_chunk$set(fig.width = fig.width)
knitr::opts_chunk$set(fig.height = fig.height)
knitr::opts_chunk$set(cache = FALSE)
knitr::opts_knit$set(concordance = TRUE) # rstudio setting broken

kable_caption_bottom <- function(x) {
  y <- unlist(strsplit(as.character(x), '\\n'))
  cap_line <- grep("caption", y)
  cap <- y[cap_line]
  last <- y[length(y)]
  y <- y[-c(cap_line, length(y))]
  y <- c(y, cap, last)
  y <- paste(y, sep = "\\n")
  class(y) <- "knitr_kable"
  attr(y, "format") <- "latex"
  y
}

my_kable <- function(x, col.names, caption, ...)
  kable_caption_bottom(
    knitr::kable(x, 
                 col.names = sprintf("%s", col.names),
                 escape = FALSE,
                 format = "latex",
                 longtable = TRUE,
                 caption = caption, 
                 ...))

## ----longtail, eval=TRUE, echo=FALSE, fig.cap="Frequency distribution of ICD codes in 5,000 pediatric hospital inpatients showing nearly 4,000 unique ICD codes; 1,401 appear only once, making them and the many other low-frequency codes of low or negative value in inter-group comparisons."----
h <- inverse.rle(structure(list(
  lengths = c(
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 2, 2, 1, 1, 1,
    2, 1, 1, 1, 1, 1, 3, 1, 2, 1, 1, 1, 4, 2, 1, 1, 2, 2, 4, 4, 2, 1,
    1, 2, 1, 1, 1, 3, 1, 2, 1, 4, 1, 2, 4, 4, 3, 2, 3, 7, 5, 2, 10, 4,
    4, 4, 5, 6, 6, 1, 8, 13, 9, 11, 10, 13, 13, 14, 10, 16, 23, 18, 
    24, 27, 32, 39, 45, 33, 51, 87, 86, 76, 126, 166, 240, 365, 632,
    1401),
  values = c(
    525, 405, 296, 283, 281, 268, 227, 209, 193, 180, 168, 166, 156, 
    146, 144, 135, 134, 131, 120, 116, 115, 113, 110, 106, 103, 90, 88,
    86, 85, 82, 81, 80, 78, 77, 76, 75, 73, 72, 71, 70, 69, 68, 67, 64,
    63, 62, 61, 56, 55, 54, 53, 51, 50, 49, 48, 46, 45, 44, 43, 41, 40, 
    39, 38, 37, 36, 35, 34, 33, 32, 31, 30, 29, 28, 27, 26, 25, 24, 23,
    22, 21, 20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5,
    4, 3, 2, 1)), class = "rle"))
  plot(h, type = "h", 
       xlab = "ICD code, by descending frequency", 
       ylab = "count", 
       xlim = c(0, 4000),
       log = "y")

## ----terminology, echo=FALSE, eval=TRUE, results='asis'------------------
termdf <- as.data.frame(
  matrix(byrow = TRUE, ncol = 2,
         data = c(
           "comorbidity", "broad category of disease, e.g., Cancer",
           "comorbidity map", 
           "set of comorbidities, each defined by diagnostic codes",
           "patient-visit",
           paste("record identifier, unique for each", 
                 "encounter with a patient, but could",
                 "represent a patient at one moment, or a",
                 "summation of all conditions a patient has",
                 "ever had"))))
my_kable(termdf, col.names = c("Term", "Description"),
         align = c("l", "p{10 cm}"),
         caption = "Terminology")

## ----suckedintoengine----------------------------------------------------
library("icd")
explain_code("V97.33XD")

## ----exampleambiguity----------------------------------------------------
explain_code(as.icd9("V10"))
explain_code(as.icd10("V10"))
explain_code("0100")
explain_code("100")

## ----exampleicdcodewho---------------------------------------------------
explain_code(c("S62", "S62.6"))

## ----exampleicdcodecm----------------------------------------------------
explain_code(c("S62.60", "S62.607", "S62.607S"))

## ----charlsonnames-------------------------------------------------------
names(icd10_map_charlson)

## ----firstfewcharlson----------------------------------------------------
icd10_map_charlson[1:2]

## ----comorbidmatrix, echo=FALSE, fig.cap="These are visualizations of some complete maps, black representing the appearance of a particular ICD code in a comorbidity column", dev="png", dpi=bitmap_dpi----
cmbimage <- function(map, xlab, ...) {
  code <- unique(unlist(map))
  x <- comorbid(map = map, x = data.frame(ptid = seq_along(code), code))
  mode(x) <- "integer"
  image(z = t(x), ylim = c(1, 0),
        col = c("#FFFFFF", "#000000"),
        xaxt = 'n', yaxt = 'n',
        useRaster = TRUE, ...)
  mtext(text = xlab, side = 1, line = 1.5, outer = FALSE)
}
{
  par(mfcol = c(1, 3), cex = 1,
      mar = c(2, 2, 2, 1) + 0.1, oma = rep(0.5, 4))
  cmbimage(icd9_map_ahrq, xlab = "ICD-9 AHRQ\ncomorbidities")
  mtext(text = "ICD codes", side = 2, line = 0.5, outer = FALSE)
  cmbimage(icd10_map_ahrq, xlab = "ICD-10 AHRQ\ncomorbidities")
  cmbimage(icd9_map_multi_ccs[["lvl1"]], xlab = "ICD-9 CCS\ncategories")
}

## ----simplemap, eval = FALSE---------------------------------------------
#  list(
#    "Rheumatic Heart Disease" = "I098",
#    "Hypertension" = c("I10", "I11"),
#    "Heart failure" = c("I50", "I110")
#  )

## ----workedexinput, echo=FALSE, results="asis"---------------------------
workedexinput <- matrix(
  ncol = 4,
  data = c(
    paste("Encounter", c("one", "two", "three", "four")),
    "K401", "I0981", "M352", "I110",
    "", "C450", "I10", "H40001",
    "", "", "", "I10"))
my_kable(
  workedexinput, 
  col.names = c("Patient-Visit", sprintf("Code %i", 1:3)),
  caption = paste("Four patient-visits with some ICD-10 codes in",
                  "`wide' format for worked example"))

## ----cmbresult, echo=FALSE, results="asis"-------------------------------
workedexinput <- matrix(
  ncol = 4,
  data = c(
    paste("Encounter", c("one", "two", "three", "four")),
    "", "yes", "", "",
    "", "", "yes", "yes",
    "", "", "", "yes"
  ))
my_kable(
  workedexinput, 
  col.names = c("Patient-Visit", "Rheum", "HTN", "CHF"),
  caption = paste("Output of the worked example using ICD-10 codes.",
                  "`Rheum' is Rheumatic Disease, `HTN' is",
                  "hypertension, `CHF' is Congestive Heart Failure."))

## ----vermonthead---------------------------------------------------------
head(vermont_dx[1:10])

## ----vermontlong---------------------------------------------------------
v <- wide_to_long(vermont_dx)[c("visit_id", "icd_code")]
head(v)

## ----vermontcompute------------------------------------------------------
v_cmb <- comorbid_charlson(v, return_df = TRUE)

## ----vermontresult, echo=FALSE-------------------------------------------
print(head(v_cmb), row.names = FALSE)

## ----vermontimage, echo=FALSE, fig.cap="This visualization of the result of the comorbidity calculation shows a black cell for each positive comorbidity in one thousand patients from Vermont, USA.", dev="png", dpi=bitmap_dpi----
comorbid_matrix <- comorbid_ahrq(v)
{
  image(comorbid_matrix, col = c("#FFFFFF", "#000000"),
        xaxt = 'n', yaxt = 'n', useRaster = FALSE)
  mtext(text = "Comorbidity", side = 2, line = 1)
  mtext(text = "Patient-visit", side = 1, line = 1)
}

## ----bench, echo=FALSE---------------------------------------------------
fac <- 1e-3
res <- structure(list(
  datarows = c(10, 100, 1000, 10000, 1e+05, 1e+06, 1e+07), 
  icd = c(
    0.0010278929839842,
    0.00120355357648805,
    0.00180120998993516,
    0.008042294124607, 
    0.062866612104699, 
    1.573,
    15.609
    ),
  comorbidity = c(
    0.0132215245394036, 
    0.0231163185089827,
    0.111484928464051, 
    1.00265117513482,
    5.36533053999301, 
    87.162, 
    10986.539
    ),
  medicalrisk = c(
    0.00351565598975867, 
    0.0102955044712871, 
    0.0715644441079348, 
    0.756538210087456,
    7.0441670359578, 
    72.286, 
    854.759
    )), 
  row.names = c(NA, -7L), 
  class = "data.frame")
fit_res <- log10(res[4:7, ])
icd_model <- lm(icd ~ datarows, data = fit_res)
cmb_model <- lm(comorbidity ~ datarows, data = fit_res)
mdr_model <- lm(medicalrisk ~ datarows, data = fit_res)
pred_hours <- function(model)
  10 ^ predict(model, data.frame(datarows = log10(20 * 1e8))) / 3600
preds <- vapply(list(icd_model, cmb_model, mdr_model),
                FUN = pred_hours, FUN.VALUE = numeric(1))
names(preds) <- c("icd", "comorbidity", "medicalrisk")
xseq = seq(0, 7)
yseq = seq(-3, 3, 3)
ysrr = 0:4
logxaxis <- sapply(paste0("expression(10^", xseq, ")"),
                   function(x) eval(parse(text = x)))
logyaxis <- sapply(paste0("expression(10^", yseq, ")"),
                   function(x) eval(parse(text = x)))
logyaxrr <- sapply(paste0("expression(", 10^ysrr, ")"),
                   function(x) eval(parse(text = x)))
colours <- c(comorbidity = 'darkred',
             icd = 'black',
             medicalrisk = 'darkblue')
rr <- data.frame(datarows = res$datarows,
                       icd = 1,
                       comorbidity = res$comorbidity / res$icd,
                       medicalrisk = res$medicalrisk / res$icd)

## ----versus, echo=FALSE, fig.cap="Performance comparison of comorbidity packages up to 10,000,000 rows, with 500,000 patient-visits and 20 comorbidities per visit. Models are fitted where the log-log relationship becomes linear, where rows > 1,000. Using an eight core 3.40GHz CPU, 32GB RAM R 3.5.1 using Linux, kernel 4.15. \\pkg{comorbidity} was run with and without parallel option, and the best strategy was chosen for each number of iterations."----
plt_inset <- 0.05
xmin = 10
  {
  plot(NA, NA, log = "xy",
       type = "l", col = 'darkred',
       xlab = "rows of data",
       ylab = "seconds",
       xlim = c(xmin, max(res$datarows)),
       ylim = c(fac, max(c(res$medicalrisk, res$comorbidity))),
       xaxt = "n", yaxt = "n"
  )  
  axis(1, 10^xseq, logxaxis)
  axis(2, 10^yseq, logyaxis)
  lines(res$datarows, res$comorbidity, col = colours["comorbidity"])
  lines(res$datarows, res$icd, col = colours["icd"])
  lines(res$datarows, res$medicalrisk, col = colours["medicalrisk"])
  abline(icd_model, col = colours["icd"], lty = 3)
  abline(cmb_model, col = colours["comorbidity"], lty = 3)
  abline(mdr_model, col = colours["medicalrisk"], lty = 3)
  legend("topleft", inset = plt_inset, legend = names(res[-1]), fill = colours[names(res[-1])])
}

## ----speedup, echo=FALSE, fig.width=6, fig.height=3.7, fig.cap="Relative speed-up using icd compared to the alternatives, using the same numbers of patient-visits and comorbidities as in Figure \\ref{fig:versus}."----
{
  ymaxrr <- 10^ceiling(
    log10(
      max(c(rr$medicalrisk, rr$comorbidity))
    )
  )
  plot(NA, NA, log = "xy",
       type = "l", col = 'darkred',
       xlab = "rows of data",
       ylab = "time / time using 'icd'",
       xlim = c(xmin, max(rr$datarows)),
       ylim = c(1, ymaxrr),
       xaxt = "n", yaxt = "n"
  )
  axis(1, 10^xseq, logxaxis)
  axis(2, 10^ysrr, logyaxrr)
  lines(rr$datarows, rr$icd, col = colours["icd"])
  lines(rr$datarows, rr$comorbidity, col = colours["comorbidity"])
  lines(rr$datarows, rr$medicalrisk, col = colours["medicalrisk"])
  legend("topleft", inset = plt_inset, 
         legend = names(rr[-1]), 
         fill = colours[names(rr[-1])])
}

## ----bigdata, echo=FALSE, fig.cap="Predicted duration of computation for one hundred-million patient-visits, with twenty diagnoses per patient"----
{
  barplot(preds,
          col = colours[c("icd", "comorbidity", "medicalrisk")],
          ylab = "hours", log = "y", ylim = c(1, 100000))
  legend("topleft", inset = plt_inset, legend = names(preds), fill = colours[names(preds)])
}


## ----pulmonaryproblem----------------------------------------------------
sc <- c("Chronic Obstructive Pulmonary Disease And Allied Conditions",
        "Pneumoconioses And Other Lung Diseases Due To External Agents")
icd9_sub_chapters[sc]

## ----permute497----------------------------------------------------------
explain_code(c("497", "479", "947", "974", "749", "794"), warn = FALSE)

## ----charlson497---------------------------------------------------------
"497" %in% icd9_map_charlson

## ----neighbor497---------------------------------------------------------
"49699" %in% icd9_map_quan_deyo[["Pulmonary"]]
"496999" %in% icd9_map_charlson

## ----moregenerous--------------------------------------------------------
alice <- data.frame(id = "alice", icd9 = "49699")
comorbid_charlson(alice, return_df = TRUE)[["Pulmonary"]]

## ----elixrange-----------------------------------------------------------
head("243" %i9da% "244.2")
"244" %in% ("243" %i9da% "244.2")

## ----validity------------------------------------------------------------
is_valid(c("441", "441.0", "441.01", "XXX"))
is_billable(c("441", "441.0", "441.01", "XXX"))
head(
  data.frame(code = children("441"),
             billable = is_billable(children("441"))))

## ----hierarchy441--------------------------------------------------------
children("441")

## ----explain4410---------------------------------------------------------
explain_code(children("4410"))

## ----explaineach4410-----------------------------------------------------
explain_code(children("4410"), condense = FALSE)

