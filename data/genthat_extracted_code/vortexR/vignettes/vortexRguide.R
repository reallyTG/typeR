## ----eval=FALSE----------------------------------------------------------
#  library(devtools, quietly=TRUE)
#  devtools::install_github("carlopacioni/vortexR")

## ----eval=FALSE----------------------------------------------------------
#  devtools::install_github("carlopacioni/vortexR", build_vignette=TRUE)

## ------------------------------------------------------------------------
library(vortexRdata)
pac.dir <- system.file("extdata", "pacioni", package="vortexRdata")

## ------------------------------------------------------------------------
library(vortexR)
woylie.st.classic <- collate_dat("Pacioni_et_al", 3, scenario = "ST_Classic",
                            dir_in = pac.dir, save2disk=FALSE, verbose=FALSE)
woylie.st.classic[1:5, 1:5]

## ---- fig.height=4.5, fig.width=7----------------------------------------
dot <- dot_plot(data=woylie.st.classic, project="Pacioni_et_al", scenario="ST_Classic",
               yrs=c(80, 120), params="Nall", save2disk=FALSE)

## ---- fig.height=4, fig.width=7------------------------------------------
lineplot.st.classic <- line_plot_year(data=woylie.st.classic, project="Pacioni_et_al",
                         scenario="ST_Classic", params="Nall", save2disk=FALSE)

## ---- fig.height=4, fig.width=7------------------------------------------
lineMidPlot.st.classic <- line_plot_year_mid(woylie.st.classic[woylie.st.classic$SV2 > 1, ], 
                                             project="Pacioni_et_al", scenario="ST_Classic", 
                                             yrmid=50, params="Nall", save2disk=FALSE)

## ------------------------------------------------------------------------
yr.st.classic <- collate_yr(project="Pacioni_et_al", scenario="ST_Classic",
                            dir_in = pac.dir, save2disk=FALSE, verbose=FALSE)

## ------------------------------------------------------------------------
yr.st.classic[[1]][1:5, 1:8, with=FALSE]

## ------------------------------------------------------------------------
yr.st.classic[[2]][1:5, 1:7, with=FALSE]

## ------------------------------------------------------------------------
rec_rate <- rRec(data=woylie.st.classic, project="Pacioni_et_al", scenario="ST_Classic",
                  ST=TRUE, runs=3, yr0=1, yrt=20, save2disk=FALSE)
rec_rate[, c(2:4, 7:8), with=FALSE]

## ------------------------------------------------------------------------
lkup.st.classic <- lookup_table(data=woylie.st.classic, project="Pacioni_et_al",
                   scenario="ST_Classic", pop="Population 1",
                   SVs=c("SV1", "SV2", "SV3", "SV4", "SV5", "SV6", "SV7"),
                   save2disk=FALSE)
head(lkup.st.classic)

## ---- fig.height=7.5, fig.width=7----------------------------------------
library(data.table, quietly=TRUE)
library(grid, quietly=TRUE)
library(gridExtra, quietly=TRUE)
setnames(lkup.st.classic, c("Scenario", "K", "Ad.Mor", "Juv.Mor", 
                          "PY.Mor", "SD.Mor", "Mate.mon", "Init.N"))
grid.table(lkup.st.classic, rows=NULL, 
           theme=ttheme_default(core=list(bg_params=list(fill="white"))))

## ------------------------------------------------------------------------
pairw <- pairwise(data=woylie.st.classic, project="Pacioni_et_al", scenario="ST_Classic",
                params=c("Nall", "Het"), yrs=120, ST=T, type="Single-Factor",
                SVs=c("SV1", "SV2", "SV3", "SV4", "SV5", "SV6", "SV7"),
                save2disk=FALSE)

## ------------------------------------------------------------------------
pairw[[3]]

## ------------------------------------------------------------------------
pval <- pairw[[3]]
pval$SSMD_Nall120 <- round(pval$SSMD_Nall120, 4)
pval$SSMD_Het120 <- round(pval$SSMD_Het120, 4)
pval

## ------------------------------------------------------------------------
pairw[[11]]

## ------------------------------------------------------------------------
pairw[[12]][[2]][c(1:2, 21:22, 24:25)]

## ------------------------------------------------------------------------
# Collate all .run 
run <- collate_run(project="Pacioni_et_al", scenario="ST_LHS", 1, dir_in=pac.dir,
                   save2disk=FALSE, verbose=FALSE)

# Remove base scenario from the output in long format
lrun.ST_LHS.no.base <- run[[2]][!run[[2]]$Scenario == "ST_LHS(Base)", ]

## ------------------------------------------------------------------------
# Load the already collated .stdat data
data(pac.lhs)
# Remove base scenario
stdat.ST_LHS.no.base <- pac.lhs[!pac.lhs$scen.name == "ST_LHS(Base)", ]

# Create the lookup table
lkup.ST_LHS <- lookup_table(data=stdat.ST_LHS.no.base, project="Pacioni_et_al",
                            scenario="ST_LHS", pop="Population 1",
                            SVs=c("SV1", "SV2", "SV3", "SV4", "SV5", "SV6", "SV7"),
                            save2disk=FALSE)

## ---- fig.height=5, fig.width=7------------------------------------------
scatter.plot <- m_scatter(data=stdat.ST_LHS.no.base[1:33], data_type="dat",
                         lookup=lkup.ST_LHS, yr=120, popn=1, param="Nall",
                         vs=c("SV1", "SV2", "SV3"), save2disk=FALSE)
scatter.plot

## ---- fig.align='center', fig.width=4------------------------------------
reg <- fit_regression(data=lrun.ST_LHS.no.base, lookup=lkup.ST_LHS, census=F,
                  project="Pacioni_et_al", scenario="ST_LHS", popn=1,
                  param="N", vs=c("SV1", "SV2", "SV3"), l=2,  ncand=30, 
                  save2disk=FALSE)

## ---- fig.width=4, fig.align='center'------------------------------------
plot(reg, type="p")

## ------------------------------------------------------------------------
reg@formulas[1]

## ------------------------------------------------------------------------
reg@formulas[1:5]

## ------------------------------------------------------------------------
reg@crits

## ------------------------------------------------------------------------
coef(reg@objects[[1]])

## ------------------------------------------------------------------------
library(glmulti, quietly=TRUE)
coef.glmulti(reg)

## ---- fig.width=4.5, fig.align='center'----------------------------------
plot(reg, type="s")

## ------------------------------------------------------------------------
Pext <- Pextinct(data=run[[2]], project="Pacioni_et_al",
               scenario="ST_LHS", ST=TRUE, save2disk=FALSE)
head(Pext[[1]][, c(2:4, 7:8)])

## ----eval=FALSE----------------------------------------------------------
#  setwd("C:/Users/VOutput")

## ------------------------------------------------------------------------
library(data.table, quietly=TRUE)
library(vortexRdata)
pac.dir <- system.file("extdata", "pacioni", package="vortexRdata")

# Run collate_yr on all .yr of the project 'Pacioni_et_al' and the ST scenario
# 'ST_Classic' in the selected folder and store the result in 'yr.st.classic'
yr.st.classic <- collate_yr(project="Pacioni_et_al", scenario="ST_Classic",
                            dir_in = pac.dir, save2disk=FALSE, verbose=FALSE)
yr.st.classic[[1]][, 1:7, with=FALSE]
yr.st.classic[[2]][, 1:6, with=FALSE]

## ------------------------------------------------------------------------
data(pac.yr)
lyr.classic <- conv_l_yr(pac.yr[[1]] , yrs=c(60, 120), save2disk=FALSE)
lyr.classic[, 1:6, with=FALSE]

## ------------------------------------------------------------------------
data(sta.main, sta.evy5, sta.evy5.b11) # load data
dfs <- list(sta.main, sta.evy5, sta.evy5.b11) # make a list
combined <- collate_proc_data(dfs, save2disk=FALSE) # combine

## ----eval=FALSE----------------------------------------------------------
#  count_data=c("Nextant", "Nall", "Nalleles", "N", "AM", "AF", "Subadults",
#  		"Juv", "nDams", "nBroods", "nProgeny", "nImmigrants",
#  		"nEmigrants", "nHarvested", "nSupplemented", "YrExt",
#  		"Alleles")

## ---- message=FALSE------------------------------------------------------
data(pac.yr)
NadultAll <- Nadults(data=pac.yr[[2]], scenarios="all", 
  gen=2.54, yr0=50, yrt=120, save2disk=FALSE)
NadultAll

## ------------------------------------------------------------------------
data(pac.clas)
 
NeAll <- Ne(data=pac.clas, scenarios="all", gen=2.54, yr0=50, yrt=120,
      save2disk=FALSE)
NeAll

## ------------------------------------------------------------------------
# load required package
require(data.table)

# set the key in NadultAll to extract the pop you want to calculate Ne for
setkey(NadultAll, Population)

# Calculate the ratios
NeNRatio <- data.table(NeAll[ , "Population 1", with=F]/NadultAll["pop1", Nad],
                        Scenario=NeAll[ , Scenario])

## ---- eval=FALSE---------------------------------------------------------
#  # write results to disk
#  write.csv(NeNRatio, file="./DataAnalysis/NeNRatio.csv", row.names=F)
#  
#  # load required packages to calculate Ne:N ratios for several scenarios
#  require(reshape2)
#  require(data.table)
#  
#  # This stacks data based on the scenario's names
#  NeStacked <- melt(NeAll, id="Scenario")
#  
#  # set the key and name coloumns
#  setkey(NeStacked, Scenario)
#  setnames(NeStacked, c("variable", "value"), c("Population", "Ne"))
#  
#  # Calculate the ratios
#  NeNRatio <- data.table(Scenario = NeStacked[ , Scenario],
#           Population = NeStacked[ , Population],
#           NeNRatio = NeStacked[, Ne]/NadultAll[, Nad])

