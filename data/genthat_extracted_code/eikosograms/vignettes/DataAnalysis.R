## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
library(knitr)
set.seed(12314159)
imageDirectory <- "./img"
dataDirectory <- "./data"
path_concat <- function(path1, path2, sep="/") {paste(path1, path2, sep = sep)}

## ----libraries-----------------------------------------------------------
library(eikosograms)
library(gridExtra)

## ----UCBAdmissions 2 way, eval = FALSE, echo = TRUE, fig.width=8, fig.height=4, fig.align="center", out.width="80%"----
#  e1 <- eikos(Admit ~ Gender, data = UCBAdmissions,
#              yaxs = FALSE, xaxs = FALSE,
#              draw = FALSE)
#  e2 <- eikos(Admit ~ Dept, data = UCBAdmissions,
#              yaxs = FALSE, xaxs = FALSE,
#              draw = FALSE)
#  # Using the gridExtra package, draw these in a single plot
#  grid.arrange(e1, e2, nrow = 1)

## ----png UCBAdmissions 2 way, eval = TRUE, echo = FALSE, fig.width=8, fig.height=4, fig.align="center", out.width="80%"----
include_graphics("img/DataAnalysis/UCB2way.png")

## ----UCBAdmissions 3 way, echo = TRUE, eval = FALSE, fig.width=12, fig.height=4, fig.align="center", out.width="80%"----
#  eikos(Admit ~  Gender + Dept, data = UCBAdmissions,
#        yaxs = FALSE, xaxs = FALSE,
#        lock_aspect = FALSE,
#        xlab_rot = 90, xvals_size = 8,
#        ispace = list(bottom = 15))

## ----png UCBAdmissions 3 way, eval = TRUE, echo = FALSE, fig.width=8, fig.height=4, fig.align="center", out.width="80%"----
include_graphics("img/DataAnalysis/UCB3way.png")

## ----UCBAdmissions, eval = FALSE, echo = TRUE, fig.width=8, fig.height=4, fig.align="center", out.width="80%"----
#  eikos(Gender ~ Dept, data = UCBAdmissions, yprobs = seq(0,1,0.25), xaxs = FALSE)

## ----png UCBAdmissions, eval = TRUE, echo = FALSE, fig.width=8, fig.height=4, fig.align="center", out.width="50%"----
include_graphics("img/DataAnalysis/UCBAdmissions.png")

## ----read lizard data----------------------------------------------------
lizards <- read.table("data/AnolisLizards.txt", header=TRUE)
lizards

## ----separate species----------------------------------------------------
sagrei <- lizards[lizards$species == "sagrei", -1]
augusticeps <- lizards[lizards$species == "augusticeps", -1]

## ----sagreiTable, eval = TRUE, echo = TRUE, fig.width=12, fig.height=4, fig.align="center", out.width="80%"----
sagreiTable <- xtabs(count ~ perch_height_ft + perch_diameter_inches, data = sagrei)

## ----sagrei perch, eval = FALSE, echo = TRUE, fig.width=12, fig.height=4, fig.align="center", out.width="80%"----
#  eikos(perch_height_ft ~ perch_diameter_inches, data = sagreiTable,
#        main = "Habitat of adult male anolis sagrei lizards")

## ----png sagrei perch, eval = TRUE, echo = FALSE, fig.width=8, fig.height=4, fig.align="center", out.width="50%"----
include_graphics("img/DataAnalysis/sagreiPerch.png")

## ----sagrei independence-------------------------------------------------
chisq.test(sagreiTable)

## ----augusticepsTable, echo = TRUE, fig.width=12, fig.height=4, fig.align="center", out.width="80%"----
augusticepsTable <- xtabs(count ~ perch_height_ft + perch_diameter_inches, data = augusticeps)

## ----augusticeps perch, eval = FALSE, echo = TRUE, fig.width=12, fig.height=4, fig.align="center", out.width="80%"----
#  eikos(perch_height_ft ~ perch_diameter_inches, data = augusticepsTable,
#        main = "Habitat of adult male anolis augusticeps lizards")

## ----png augusticeps perch, eval = TRUE, echo = FALSE, fig.width=8, fig.height=4, fig.align="center", out.width="50%"----
include_graphics("img/DataAnalysis/augusticepsPerch.png")

## ----lizards three way table, eval = TRUE, echo = TRUE, fig.width=7, fig.height=4, fig.align="center", out.width="80%"----
lizardsTable <- xtabs(count ~ species + perch_height_ft + perch_diameter_inches,
                      data = lizards)

## ----lizards three way, eval = FALSE, echo = TRUE, fig.width=7, fig.height=4, fig.align="center", out.width="80%"----
#  eikos(species ~ . , data = lizardsTable, lock_aspect = FALSE, yprobs = seq(0,1, 0.1))

## ----png lizards three way, eval = TRUE, echo = FALSE, fig.width=8, fig.height=4, fig.align="center", out.width="50%"----
include_graphics("img/DataAnalysis/lizards3way.png")

## ---- echo = FALSE-------------------------------------------------------
knitr::kable(head(mtcars))

## ----mtcars factor creation----------------------------------------------
mtcars$vs <- factor(mtcars$vs, labels = c("V-shaped", "straight"))
mtcars$am <- factor(mtcars$am, labels = c("automatic", "manual"))

## ---- echo = FALSE-------------------------------------------------------
knitr::kable(head(mtcars))

## ----am vs, eval = FALSE, echo = TRUE, fig.width=12, fig.height=4, fig.align="center", out.width="80%"----
#  eikos(am ~ vs, data = mtcars)

## ----png r am vs, eval = TRUE, echo = FALSE, fig.width=8, fig.height=4, fig.align="center", out.width="50%"----
include_graphics("img/DataAnalysis/amvs.png")

## ----am and ordinal 1, eval = FALSE, echo = TRUE, fig.width=12, fig.height=4, fig.align="center", out.width="80%"----
#  eikos(am ~ cyl, data = mtcars)

## ----png am and ordinal 1, eval = TRUE, echo = FALSE, fig.width=8, fig.height=4, fig.align="center", out.width="40%"----
include_graphics("img/DataAnalysis/amordinal1.png")

## ----ordinal 2, eval = FALSE, echo = TRUE, fig.width=12, fig.height=4, fig.align="center", out.width="80%"----
#  eikos(gear ~ cyl, data = mtcars)

## ----png ordinal 2, eval = TRUE, echo = FALSE, fig.width=8, fig.height=4, fig.align="center", out.width="37%"----
include_graphics("img/DataAnalysis/ordinal2.png")

## ----poisson model, echo = TRUE, fig.width=12, fig.height=4, fig.align="center", out.width="80%"----
fittedModel <- glm(count ~ species + perch_height_ft, 
                   family="poisson", 
                   data = lizards)

## ----poisson model fitted data, echo = TRUE, fig.width=12, fig.height=4, fig.align="center", out.width="80%"----
# Can simply append the fitted values to the lizards to get a new data frame
lizardsFit <- data.frame(lizards,  fit = fittedModel$fitted.values)
# and create the table
fitTable <- xtabs(fit ~  species + perch_height_ft,  data=lizardsFit)

## ----poisson model asserts, eval = FALSE, echo = TRUE, fig.width=12, fig.height=4, fig.align="center", out.width="80%"----
#  eikos("species", "perch_height_ft", data = fitTable)

## ----png poisson model asserts, eval = TRUE, echo = FALSE, fig.width=8, fig.height=4, fig.align="center", out.width="60%"----
include_graphics("img/DataAnalysis/poisson1.png")

## ----poisson model 3way, echo = TRUE, fig.width=12, fig.height=4, fig.align="center", out.width="80%"----
fittedModel3way <- glm(count ~ species + perch_height_ft + perch_diameter_inches +
                           perch_height_ft * species + 
                           perch_diameter_inches * species, 
                       family="poisson", 
                       data = lizards)

## ----poisson model fitted data 3way, eval = FALSE, echo = TRUE, fig.width=12, fig.height=4, fig.align="center", out.width="80%"----
#  # Can simply append the fitted values to the lizards to get a new data frame
#  lizardsFit3way <- data.frame(lizards,  fit = fittedModel3way$fitted.values)
#  # and create the table
#  fitTable3way <- xtabs(fit ~  species + perch_height_ft + perch_diameter_inches,  data=lizardsFit3way)
#  # and show the eikosograms
#  eikos(y = "perch_diameter_inches", x = c("perch_height_ft", "species"), data = fitTable3way,
#        xlab_rot = 30)

## ----png poisson model fitted data 3way, eval = TRUE, echo = FALSE, fig.width=8, fig.height=4, fig.align="center", out.width="60%"----
include_graphics("img/DataAnalysis/poisson2.png")

