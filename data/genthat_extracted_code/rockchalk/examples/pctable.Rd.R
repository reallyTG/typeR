library(rockchalk)


### Name: pctable
### Title: Creates a cross tabulation with counts and percentages
### Aliases: pctable pctable pctable.default pctable.formula
###   pctable.character

### ** Examples

dat <- data.frame(x = gl(4, 25),
                  y = sample(c("A", "B", "C", "D", "E"), 100, replace= TRUE))
pctable(y ~ x, dat)
pctable(y ~ x, dat, exclude = NULL)
pctable(y ~ x, dat, rvlab = "My Outcome Var", cvlab = "My Columns")
pctable(y ~ x, dat, rowpct = TRUE, colpct = FALSE)
pctable(y ~ x, dat, rowpct = TRUE, colpct = TRUE)
pctable(y ~ x, dat, rowpct = TRUE, colpct = TRUE, exclude = NULL)
tab <- pctable(y ~ x, dat, rvlab = "Outcome", cvlab = "Predictor")
dat <- data.frame(x1 = gl(4, 25, labels = c("Good", "Bad", "Ugly", "Indiff")),
                x2 = gl(5, 20, labels = c("Denver", "Cincy", "Baltimore", "NY", "LA")), 
                y = sample(c("A", "B", "C", "D", "E"), 100, replace= TRUE))
tab <- pctable(y ~ x1, data = dat, rvlab = "my row label",
    subset = dat$x1 %in% c("Good", "Bad"),
    drop.unused.levels = TRUE)
tab <- pctable(y ~ x1, data = dat, rvlab = "my row label",
    subset = dat$x1 %in% c("Good", "Bad"))
pctable("y", "x1", dat)
pctable("y", x1, dat)
tab <- pctable(y ~ x2, data = dat, rvlab = "A Giant Variable")
summary(tab, rowpct = TRUE, colpct = FALSE)
tabsum <- summary(tab)
## No test: 
## if user has tables package, can push out to latex or html
if (require(tables) & require(Hmisc)){
    tabsumtab <- tables::as.tabular(tabsum)
    Hmisc::html(tabsumtab)
    fn <- tempfile(pattern = "file", tmpdir = tempdir(), 
            fileext = ".html")
    Hmisc::html(tabsumtab, file = fn)
    print(paste("The file saved was named", fn, "go get it."))
    if (interactive()) browseURL(fn)
    ## go get the fn file if you want to import it in document
    ## Now LaTeX output
    ## have to escape the percent signs
    tabsumtab <- apply(tabsumtab, 1:2, function(x) {gsub("%", "\\\\%", x) })
    fn2 <- tempfile(pattern = "file", tmpdir = tempdir(), 
                   fileext = ".tex")
    Hmisc::latex(tabsumtab, file = fn2)
    print(paste("The file saved was named", fn2, "go get it."))
}
## End(No test)



