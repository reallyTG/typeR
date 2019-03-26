library(kutils)


### Name: semTable
### Title: Creates Structural Equation Modeling Tables
### Aliases: semTable

### ** Examples

## No test: 
## These run longer than 5 seconds
## CFA model
require(lavaan)

tempdir <- tempdir()
## The example from lavaan's docs
HS.model <- ' visual  =~ x1 + x2 + x3
              textual =~ x4 + x5 + x6
              speed   =~ x7 + x8 + x9'
fit1 <- cfa(HS.model, data = HolzingerSwineford1939,
            std.lv = TRUE, meanstructure = TRUE)
fit1.t1 <- semTable(fit1, columns = c("est", "estse"),
                    fits = c("chisq", "rmsea"), file = file.path(tempdir, "fit1.t1"),
                    varLabels = c("x1" = "hello"))
if (interactive()) testtable("fit1.t1", tempdir)
## Now demonstrate variable labels
vl <- c(visual = "Visual", textual = "Textual", speed = "Speed",
       x1 = "V1", x2 = "V2", x3 = "V3")
fit1.t2 <- semTable(fit1, columns = c("est", "estse"),
                    fits = c("chisq", "rmsea"), file = file.path(tempdir, "fit1.t2"),
                    varLabels = vl)
if (interactive()) testtable("fit1.t2", tempdir)
## floating table
fit1.t3 <- semTable(fit1, columns = c("est", "estse"),
                    fits = c("chisq", "rmsea"), file = file.path(tempdir, "fit1.t3"),
                    varLabels = vl, table.float = TRUE,
                    caption = "Holzinger Swineford 1939",
                    label = "tab:hs1939")
if (interactive()) testtable("fit1.t3", tempdir)
fit1.t4 <- semTable(fit1, columns = c("est", "estse"),
                    fits = c("chisq", "rmsea"), file = file.path(tempdir, "fit1.t3"),
                    varLabels = vl, longtable = TRUE,
                    caption = "Holzinger Swineford 1939",
                    label = "tab:hs1939")
if (interactive()) testtable("fit1.t4", tempdir)
fit1.t5 <- semTable(fit1, fits = c("chisq", "rmsea"),
               columns = c("est", "se"), columnLabels = c(se = "S.E."),
               file = file.path(tempdir, "fit1.t5"))
if (interactive()) testtable("fit1.t5", tempdir)
fit1.t6 <- semTable(fit1, fits = c("chisq", "rmsea"),
               columns = c("estsestars"),
               columnLabels = c("estsestars" = "Est(SE)"),
               file = file.path(tempdir, "fit1.t6"))
if (interactive()) testtable("fit1.t6", tempdir)
vl <- c(x1 = "happy 1", x2 = "happy 2", x3 = "happy 3",
        visual = "Seeing", textual = "Thumb Texting")
fit1.t7 <- semTable(fit1, fits = c("chisq", "rmsea"),
               columns = c("eststars", "p"),
               columnLabels = c("eststars" = "Est(SE)"),
               file = file.path(tempdir, "fit1.t7"),
               varLabels = vl, longtable = TRUE, type = "latex")

if (interactive()) testtable("fit1.t7", tempdir)
# Change output format to csv
cat(markupConvert(attr(fit1.t7, "markedResults"), type = "csv"))

## 2 groups
fit1.g <- cfa(HS.model, data = HolzingerSwineford1939, std.lv = TRUE, group = "school")
fit1.gt1 <- semTable(fit1.g, columns = c("estsestars", "p"),
               columnLabels = c(estsestars = "Est w/stars", p = "p-value"),
               file = file.path(tempdir, "fit1.gt1"))
if (interactive()) testtable("fit1.gt1", tempdir)
## Now name particular group by name
fit1.gt2 <- semTable(fit1.g, columns = c("estsestars", "p"),
               columnLabels = c(estsestars = "Est w/stars", p = "p-value"),
               file = file.path(tempdir, "fit1.gt2"), groups = "Pasteur")
if (interactive()) testtable("fit1.gt2", tempdir)
## Name particular group by number
fit1.gt3 <- semTable(fit1.g, columns = c("estsestars", "p"),
               columnLabels = c(estsestars = "Est w/stars", p = "p-value"),
               file = file.path(tempdir, "fit1.gt3"), groups = 1)
if (interactive()) testtable("fit1.gt3", tempdir)

## Fit same model with standardization
fit1.std <- update(fit1, std.lv = TRUE, std.ov = TRUE, meanstructure = TRUE) 
## include 2 models in table request
fit1.t2 <- semTable(list("Ordinary" = fit1, "Standardized" = fit1.std),
                    file = file.path(tempdir, "fit1.2.1"))
semTable(list("Ordinary" = fit1, "Standardized" = fit1.std),
    columns = list("Ordinary" = c("est", "se"), "Standardized" = c("est")),
    columnLabels = c(est = "Est", se = "SE"), file = file.path(tempdir, "fit1.2.2"))
if (interactive()) testtable("fit1.2.2", tempdir)

fit1.t2 <- semTable(fit1, fits = c("chisq", "rmsea"), print.results = FALSE)
cat(fit1.t2)
fit1.t3 <- semTable(fit1, fits = c("chisq", "rmsea", "tli"),
               columns = c("est", "se"))

## Can create file with cat
cat(fit1.t3, file = file.path(tempdir, "fit1.t3.tex"))

## Basic SEM
regmodel1 <- 'visual  =~ x1 + x2 + x3 
             textual =~ x4 + x5 + x6
             speed   =~ x7 + x8 + x9
             visual ~ textual + speed
'

fit2 <- sem(regmodel1, data = HolzingerSwineford1939, std.lv = TRUE,
            meanstructure = TRUE)

fit2.std <- update(fit2, std.lv = TRUE, std.ov = TRUE, meanstructure = TRUE) 

fit2.t <- semTable(list("Ordinary" = fit2, "Standardized" = fit2.std), fits = "rmsea",
                   columns = list("Ordinary" = c("est", "se", "p"),
                                   "Standardized" = c("estsestars")),
                   columnLabels = c("est" = "Est", "se" = "Std.Err.", "p" = "p",
                                    "estsestars" = "Standardized Est."),
                   paramSets = c("loadings", "intercepts", "slopes", "latentcovariances"),
                   file = file.path(tempdir, "fit2.t1"), type = "latex")

if (interactive()) testtable("fit2.t1", tempdir)

# Change output format to csv
cat(markupConvert(attr(fit2.t, "markedResults"), type = "csv"))
cat(markupConvert(attr(fit2.t, "markedResults"), type = "html"))

fit2.t <- semTable(list("Ordinary" = fit2, "Standardized" = fit2.std),
              type = c("html"),
              file = file.path(tempdir, "fit2.t"),
              varLabels = c(x1 = "happy 1", x2 = "happy 2", x3 = "happy 3"),
              print.results = FALSE)

if (interactive()) browseURL(file.path(tempdir, "fit2.t.html"))


regmodel2 <- 'visual  =~ x1 + x2 + x3
              textual =~ x4 +  x6
              speed   =~  x8 + x9
              visual ~ textual 
'
fit3 <- sem(regmodel2, data = HolzingerSwineford1939, std.lv = TRUE,
            meanstructure = TRUE)

fit3.t1 <-  semTable(fit3, type = c("latex"),
                     columns = c("estsestars", "rsquare"), 
                     file = file.path(tempdir, "fit3.1"),
                     print.results = FALSE)

cat(fit3.t1)
if (interactive()) testtable("fit3.1", tempdir)

fit3.std <- update(fit2, std.lv = TRUE, std.ov = TRUE)

fit3.std.t1 <- semTable(list("Mod 1" = fit2, "Mod 1 std" = fit2.std, "Mod 2" = fit3,
              "Mod 3 std" = fit3.std), columns = c("estsestars"), type = "html",
               file = file.path(tempdir, "fit3.std.t1"), print.results = FALSE)
if(interactive()) browseURL(file.path(tempdir, "fit3.std.t1.html"))

fit3 <- sem(regmodel1, data = HolzingerSwineford1939, group = "school")
## if specify 2 types, get a list of them back
fit3.t1 <- semTable(fit3, type = "latex")
fit3.t2 <- semTable(fit3, columns = c("est", "se"),
                     columnLabels = c(est = "Est.", se = "S.E."))

fit3.t2 <- semTable(fit3, fits = c("chisq", "rmsea", "cfi"), print.results = FALSE)
cat(fit3.t2)

fit3.t2 <- semTable(fit3, columns = c("estsestars"),
            fits = c("chisq", "rmsea", "cfi"), type = "html",
            file = file.path(tempdir, "fit3.t2"))
if(interactive()) browseURL(file.path(tempdir, "fit3.t2.html"))
 
fit3.t2 <- semTable(fit3, fits = c("rmsea", "cfi"))

model <- "factor =~ .7*y1 + .7*y2 + .7*y3 + .7*y4
                 y1 | -1*t1 + 1*t2
                 y2 | -.5*t1 + 1*t2
                 y3 | -.2*t1 + 1*t2
                 y4 | -1*t1 + 1*t2"
dat <- simulateData(model, sample.nobs = 300)

testmodel <- "ExampleFactor =~ y1 + y2 + y3 + y4"

fit4 <- cfa(testmodel, data = dat, ordered = colnames(dat),
            std.lv = FALSE)

fit4.t1 <- semTable(fit4, paramSets = c("loadings", "thresholds",
    "residualvariances"), fits = c("tli", "chisq"),
    fitLabels = c(tli = "TLI", chisq = "chisq"), type = "html")

fit4.t2 <- semTable(fit4, fits = c("rmsea", "cfi", "chisq"),
              fitLabels = c(rmsea = "Root M.SQ.E.A", cfi = "CompFitIdx", chisq = "chisq"),
              type = "latex")

## Model 5 - Mediation model with equality constraints
model5 <-
    '
    # latent variable definitions
    ind60 =~ x1 + x2 + x3
    dem60 =~ y1 + e*y2 + d*y3 + y4
    dem65 =~ y5 + e*y6 + d*y7 + y8
    # regressions
    dem60 ~ a*ind60
    dem65 ~ c*ind60 + b*dem60
    # residual correlations
    y1 ~~ y5
    y2 ~~ y4 + y6
    y3 ~~ y7
    y4 ~~ y8
    y6 ~~ y8

    # indirect effect (a*b)
    ## := operator defines new parameters
    ab := a*b

    ## total effect
    total := c + (a*b)
    '

fit5 <- sem(model5, data=PoliticalDemocracy)
fit5boot <- sem(model5, data=PoliticalDemocracy, se = "bootstrap", bootstrap = 100)

fit5.t1 <- semTable(list("Democracy" = fit5), columns = c("estsestars", "rsquare"),
           file = file.path(tempdir, "fit5.1t"), type = "html",
           print.results = FALSE)
if(interactive()) browseURL(file.path(tempdir, "fit5.t1.html"))

## convert same object to LaTeX, save file, then test
cat(markupConvert(attr(fit5.t1, "markedResults"), type = "latex"),
         file = file.path(tempdir, "fit5.t1.tex"))
if (interactive()) testtable("fit5.t1", tempdir)

semTable(list("Democracy" = fit5, "Bootstrapped SE" = fit5boot),
         columns = c("estsestars", "rsquare"),
         file = file.path(tempdir, "fit5.2"), type = "latex",
         longtable = TRUE)

semTable(list("Democracy" = fit5, "Bootstrapped SE" = fit5boot),
         columns = c("estsestars", "rsquare"),
         paramSets = c("loadings", "slopes", "residualvariances", "constructed"),
         file = file.path(tempdir, "fit5.3"), type = "latex",
         longtable = TRUE)

## Model 5b - Revision of Model 5s
model5b <-
    '
    # Cut some indicators from the measurement model
    ind60 =~ x1 + x2 
    dem60 =~ y1 + e*y2 + d*y3 + y4
    dem65 =~ y5 + e*y6 + d*y7 
    # regressions
    dem60 ~ a*ind60
    dem65 ~ c*ind60 + b*dem60
    # cut out the residual correlations
    # indirect effect (a*b)
    ## := operator defines new parameters
    ab := a*b

    ## total effect
    total := c + (a*b)
    '

fit5b <- sem(model5b, data=PoliticalDemocracy, se = "bootstrap",
bootstrap = 100)
semTable(list("Model 5" = fit5boot, "Model 5b" = fit5b),
         columns = c("estsestars", "rsquare"),
         file = file.path(tempdir, "fit5.5"),
          type = "latex",
         longtable = TRUE)
if(interactive()) testtable("fit5.5", tempdir)

list.files(tempdir)
## End(No test)



