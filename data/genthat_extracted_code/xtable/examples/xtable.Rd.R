library(xtable)


### Name: xtable
### Title: Create Export Tables
### Aliases: xtable xtable.anova xtable.aov xtable.aovlist
###   xtable.data.frame xtable.glm xtable.lm xtable.matrix
###   xtable.xtableMatharray xtable.prcomp xtable.coxph xtable.summary.aov
###   xtable.summary.aovlist xtable.summary.glm xtable.summary.lm
###   xtable.summary.prcomp xtable.ts xtable.table xtable.zoo xtable.sarlm
###   xtable.summary.sarlm xtable.gmsar xtable.summary.gmsar xtable.stsls
###   xtable.summary.stsls xtable.sarlm.pred xtable.splm
###   xtable.summary.splm xtable.sphet xtable.summary.sphet xtable.spautolm
###   xtable.summary.spautolm
### Keywords: file

### ** Examples


## Load example dataset
data(tli)

## Demonstrate data.frame
tli.table <- xtable(tli[1:20, ])
print(tli.table)
print(tli.table, type = "html")
xtable(mtcars)
xtable(mtcars, auto = TRUE)

## Demonstrate data.frame with different digits in cells
tli.table <- xtable(tli[1:20, ])
display(tli.table)[c(2,6)] <- "f"
digits(tli.table) <- matrix(0:4, nrow = 20, ncol = ncol(tli)+1)
print(tli.table)
print(tli.table, type = "html")

## Demonstrate matrix
design.matrix <- model.matrix(~ sex*grade, data = tli[1:20, ])
design.table <- xtable(design.matrix, auto = TRUE)
print(design.table)
print(design.table, type = "html")

## Demonstrate aov
fm1 <- aov(tlimth ~ sex + ethnicty + grade + disadvg, data = tli)
fm1.table <- xtable(fm1)
print(fm1.table)
print(fm1.table, type = "html")

## Demonstrate lm
fm2 <- lm(tlimth ~ sex*ethnicty, data = tli)
fm2.table <- xtable(fm2)
print(fm2.table)
print(fm2.table, type = "html")
print(xtable(anova(fm2)))
print(xtable(anova(fm2)), type = "html")
fm2b <- lm(tlimth ~ ethnicty, data = tli)
print(xtable(anova(fm2b, fm2)))
print(xtable(anova(fm2b, fm2)), type = "html")

## Demonstrate glm
fm3 <- glm(disadvg ~ ethnicty*grade, data = tli, family = binomial())
fm3.table <- xtable(fm3)
print(fm3.table)
print(fm3.table, type = "html")
print(xtable(anova(fm3)))
print(xtable(anova(fm3)), type = "html")

## Demonstrate aov
## Taken from help(aov) in R 1.1.1
## From Venables and Ripley (1997) p.210.
N <- c(0,1,0,1,1,1,0,0,0,1,1,0,1,1,0,0,1,0,1,0,1,1,0,0)
P <- c(1,1,0,0,0,1,0,1,1,1,0,0,0,1,0,1,1,0,0,1,0,1,1,0)
K <- c(1,0,0,1,0,1,1,0,0,1,0,1,0,1,1,0,0,0,1,1,1,0,1,0)
yield <- c(49.5,62.8,46.8,57.0,59.8,58.5,55.5,56.0,62.8,55.8,69.5,55.0,
           62.0,48.8,45.5,44.2,52.0,51.5,49.8,48.8,57.2,59.0,53.2,56.0)
npk <- data.frame(block = gl(6,4), N = factor(N), P = factor(P),
                  K = factor(K), yield = yield)
npk.aov <- aov(yield ~ block + N*P*K, npk)
op <- options(contrasts = c("contr.helmert", "contr.treatment"))
npk.aovE <- aov(yield ~  N*P*K + Error(block), npk)
options(op)

summary(npk.aov)
print(xtable(npk.aov))
print(xtable(anova(npk.aov)))
print(xtable(summary(npk.aov)))

summary(npk.aovE)
print(xtable(npk.aovE), type = "html")
print(xtable(summary(npk.aovE)), type = "html")

## Demonstrate lm
## Taken from help(lm) in R 1.1.1
## Annette Dobson (1990) "An Introduction to Generalized Linear Models".
## Page 9: Plant Weight Data.
ctl <- c(4.17,5.58,5.18,6.11,4.50,4.61,5.17,4.53,5.33,5.14)
trt <- c(4.81,4.17,4.41,3.59,5.87,3.83,6.03,4.89,4.32,4.69)
group <- gl(2,10,20, labels = c("Ctl","Trt"))
weight <- c(ctl, trt)
lm.D9 <- lm(weight ~ group)
print(xtable(lm.D9))
print(xtable(anova(lm.D9)))

## Demonstrate glm
## Taken from help(glm) in R 1.1.1
## Annette Dobson (1990) "An Introduction to Generalized Linear Models".
## Page 93: Randomized Controlled Trial :
counts <- c(18,17,15,20,10,20,25,13,12)
outcome <- gl(3,1,9)
treatment <- gl(3,3)
d.AD <- data.frame(treatment, outcome, counts)
glm.D93 <- glm(counts ~ outcome + treatment, family = poisson())
print(xtable(glm.D93, align = "r|llrc"))
print(xtable(anova(glm.D93)), hline.after = c(1), size = "small")

## Demonstration of additional formatC() arguments.
print(fm1.table, format.args = list(big.mark = "'", decimal.mark = ","))

## Demonstration of "short caption" support.
fm1sc <- aov(tlimth ~ sex + ethnicty + grade, data = tli)
fm1sc.table <- xtable(fm1sc,
  caption = c("ANOVA Model with Predictors Sex, Ethnicity, and Grade",
    "ANOVA: Sex, Ethnicity, Grade"))
print(fm1sc.table)

## Demonstration of longtable support.
## Remember to insert \usepackage{longtable} on your LaTeX preamble
x <- matrix(rnorm(1000), ncol = 10)
x.big <- xtable(x, label = 'tabbig',
                caption = 'Example of longtable spanning several pages')
print(x.big, tabular.environment = 'longtable', floating = FALSE)
x <- x[1:30, ]
x.small <- xtable(x, label = 'tabsmall', caption = 'regular table env')
print(x.small)  # default, no longtable

## Demonstration of sidewaystable support.
## Remember to insert \usepackage{rotating} on your LaTeX preamble
print(x.small, floating.environment = 'sidewaystable')

if(require(stats, quietly = TRUE)) {
  ## Demonstrate prcomp
  ## Taken from help(prcomp) in mva package of R 1.1.1
  data(USArrests)
  pr1 <- prcomp(USArrests)
  print(xtable(pr1))
  print(xtable(summary(pr1)))

#  ## Demonstrate princomp
#  ## Taken from help(princomp) in mva package of R 1.1.1
#  pr2 <- princomp(USArrests)
#  print(xtable(pr2))
}

## Demonstrate include.rownames, include.colnames,
## only.contents and add.to.row arguments
set.seed(2345)
res <- matrix(sample(0:9, size = 6*9, replace = TRUE), ncol = 6, nrow = 9)
xres <- xtable(res)
digits(xres) <- rep(0, 7)
addtorow <- list()
addtorow$pos <- list()
addtorow$pos[[1]] <- c(0, 2)
addtorow$pos[[2]] <- 4
addtorow$command <- c('\vspace{2mm} \n', '\vspace{10mm} \n')
print(xres, add.to.row = addtorow, include.rownames = FALSE,
      include.colnames = TRUE, only.contents = TRUE,
      hline.after = c(0, 0, 9, 9))

## Demonstrate include.rownames, include.colnames,
## only.contents and add.to.row arguments in Rweave files

## Not run: 
##D  \begin{small}
##D  \setlongtables ##D 
##D  \begin{longtable}{
##D  <<results = tex, fig = FALSE>>=
##D  cat(paste(c('c', rep('cc', 34/2-1), 'c'), collapse = '@{\hspace{2pt}}'))
##D  @
##D  }
##D  \hline
##D  \endhead
##D  \hline
##D  \endfoot
##D  <<results = tex, fig = FALSE>>=
##D  library(xtable)
##D  set.seed(2345)
##D  res <- matrix(sample(0:9, size = 34*90, replace = TRUE), ncol = 34, nrow = 90)
##D  xres <- xtable(res)
##D  digits(xres) <- rep(0, 35)
##D  addtorow <- list()
##D  addtorow$pos <- list()
##D  addtorow$pos[[1]] <- c(seq(4, 40, 5), seq(49, 85, 5))
##D  addtorow$pos[[2]] <- 45
##D  addtorow$command <- c('\vspace{2mm} \n', '\newpage \n')
##D  print(xres, add.to.row = addtorow, include.rownames = FALSE,
##D        include.colnames = FALSE, only.contents = TRUE, hline.after = NULL)
##D  @
##D  \end{longtable}
##D  \end{small}
## End(Not run)

## Demonstrate sanitization
mat <- round(matrix(c(0.9, 0.89, 200, 0.045, 2.0), c(1, 5)), 4)
rownames(mat) <- "$y_{t-1}$"
colnames(mat) <- c("$R^2$", "$\\bar{R}^2$", "F-stat", "S.E.E", "DW")
print(xtable(mat), type = "latex", sanitize.text.function = function(x){x})

## Demonstrate booktabs
print(tli.table)
print(tli.table, hline.after = c(-1,0))
print(tli.table, hline.after = NULL)
print(tli.table,
      add.to.row = list(pos = list(2), command = c("\vspace{2mm} \n")))

print(tli.table, booktabs = TRUE)
print(tli.table, booktabs = TRUE, hline.after = c(-1,0))
print(tli.table, booktabs = TRUE, hline.after = NULL)
print(tli.table, booktabs = TRUE,
  add.to.row = list(pos = list(2), command = c("\vspace{2mm} \n")))
print(tli.table, booktabs = TRUE, add.to.row = list(pos = list(2),
  command = c("youhou\n")), tabular.environment = "longtable")

## Don't show: 
  for(i in c("latex","html")) {
    outFileName <- paste("xtable.", ifelse(i=="latex", "tex", i), sep = "")
    print(tli.table, type = i, file = outFileName, append = FALSE)
    print(design.table, type = i, file = outFileName, append = TRUE)
    print(fm1.table, type = i, file = outFileName, append = TRUE)
    print(fm2.table, type = i, file = outFileName, append = TRUE)
    print(fm2.table, type = i, file = outFileName, append = TRUE,
          math.style.negative = TRUE)
    print(xtable(anova(fm2)), type = i, file = outFileName, append = TRUE)
    print(xtable(anova(fm2b, fm2)), type = i, file = outFileName, append = TRUE)
    print(fm3.table, type = i, file = outFileName, append = TRUE)
    print(xtable(anova(fm3)), type = i, file = outFileName, append = TRUE)
    print(xtable(npk.aov), type = i, file = outFileName, append = TRUE)
    print(xtable(anova(npk.aov)), type = i, file = outFileName, append = TRUE)
    print(xtable(summary(npk.aov)), type = i, file = outFileName, append = TRUE)
    print(xtable(npk.aovE), type = i, file = outFileName, append = TRUE)
    print(xtable(summary(npk.aovE)),
          type = i, file = outFileName, append = TRUE)
    if(i=="latex") cat("\\clearpage\n", file = outFileName, append = TRUE)
    print(xtable(lm.D9),
          type = i, file = outFileName, append = TRUE, latex.environment = NULL)
    print(xtable(lm.D9),
          type = i, file = outFileName, append = TRUE, latex.environment = "")
    print(xtable(lm.D9),
          type = i, file = outFileName, append = TRUE,
          latex.environment = "center")
    print(xtable(anova(lm.D9)), type = i, file = outFileName, append = TRUE)
    print(xtable(glm.D93), type = i, file = outFileName, append = TRUE)
    print(xtable(anova(glm.D93, test = "Chisq")),
          type = i, file = outFileName, append = TRUE)
    print(xtable(glm.D93, align = "r|llrc"),
          include.rownames = FALSE, include.colnames = TRUE,
          type = i, file = outFileName, append = TRUE)
    print(xtable(glm.D93, align = "r||llrc"),
          include.rownames = TRUE, include.colnames = FALSE,
          type = i, file = outFileName, append = TRUE)
    print(xtable(glm.D93, align = "|r||llrc"),
          include.rownames = FALSE, include.colnames = FALSE,
          type = i, file = outFileName, append = TRUE)
    print(xtable(glm.D93, align = "|r||llrc|"),
          type = i, file = outFileName, append = TRUE)
    print(xtable(anova(glm.D93)),
          hline.after = c(1), size = "small",
          type = i, file = outFileName, append = TRUE)
    if(require(stats, quietly = TRUE)) {
      print(xtable(pr1), type = i, file = outFileName, append = TRUE)
      print(xtable(summary(pr1)), type = i, file = outFileName, append = TRUE)
      # print(xtable(pr2), type = i, file = outFileName, append = TRUE)
    }
    temp.table <- xtable(ts(cumsum(1+round(rnorm(100), 2)),
                            start = c(1954, 7), frequency = 12))
    caption(temp.table) <- "Time series example"
    print(temp.table, type = i, file = outFileName,
          append = TRUE, caption.placement = "top", table.placement = "h")
    print(temp.table, type = i, file = outFileName,
          append = TRUE, caption.placement = "bottom", table.placement = "htb")
  }
## End(Don't show)




