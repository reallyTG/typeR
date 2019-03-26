library(kutils)


### Name: keyTemplate
### Title: Create variable key template (in memory or in a file)
### Aliases: keyTemplate

### ** Examples

set.seed(234234)
N <- 200
mydf <- data.frame(x5 = rnorm(N),
                   x4 = rpois(N, lambda = 3),
                   x3 = ordered(sample(c("lo", "med", "hi"),
                   size = N, replace=TRUE),
                   levels = c("med", "lo", "hi")),
                   x2 = letters[sample(c(1:4,6), N, replace = TRUE)],
                   x1 = factor(sample(c("cindy", "bobby", "marcia",
                                        "greg", "peter"), N,
                   replace = TRUE)),
                   x7 = ordered(letters[sample(c(1:4,6), N, replace = TRUE)]),
                   x6 = sample(c(1:5), N, replace = TRUE),
                   stringsAsFactors = FALSE)
mydf$x4[sample(1:N, 10)] <- 999
mydf$x5[sample(1:N, 10)] <- -999

## Note: If we change this example data, we need to save a copy in
## "../inst/extdata" for packacing
dn <- tempdir()
write.csv(mydf, file = file.path(dn, "mydf.csv"), row.names = FALSE)
mydf.templ <- keyTemplate(mydf, file = file.path(dn, "mydf.templ.csv"),
                          varlab = TRUE)
mydf.templ_long <- keyTemplate(mydf, long = TRUE,
                            file = file.path(dn, "mydf.templlong.csv"),
                            varlab = TRUE)

mydf.templx <- keyTemplate(mydf, file = file.path(dn, "mydf.templ.xlsx"),
                            varlab = TRUE)
mydf.templ_longx <- keyTemplate(mydf, long = TRUE,
                             file = file.path(dn, "mydf.templ_long.xlsx"),
                             varlab = TRUE)
## Check the varlab attribute
attr(mydf.templ, "varlab")
mydf.tmpl2 <- keyTemplate(mydf,
                         varlab = c(x5 = "height", x4 = "age",
                         x3 = "intelligence", x1 = "Name"))
## Check the varlab attribute
attr(mydf.tmpl2, "varlab")

## Try with the national longitudinal study data
data(natlongsurv)
natlong.templ <- keyTemplate(natlongsurv,
                          file = file.path(dn, "natlongsurv.templ.csv"),
                          max.levels = 15, varlab = TRUE, sort = TRUE)

natlong.templlong <- keyTemplate(natlongsurv, long = TRUE,
                   file = file.path(dn, "natlongsurv.templ_long.csv"), sort = TRUE)
if(interactive()) View(natlong.templlong)
natlong.templlong2 <- keyTemplate(natlongsurv, long = TRUE,
                      missings = "<0", max.levels = 50, sort = TRUE,
                      varlab = TRUE)
if(interactive()) View(natlong.templlong2)

natlong.templwide2 <- keyTemplate(natlongsurv, long = FALSE,
                      missings = "<0", max.levels = 50, sort = TRUE)
if(interactive()) View(natlong.templwide2)

all.equal(wide2long(natlong.templwide2), natlong.templlong2)

head(keyTemplate(natlongsurv, file = file.path(dn, "natlongsurv.templ.xlsx"),
             max.levels = 15, varlab = TRUE, sort = TRUE), 10)
head(keyTemplate(natlongsurv, file = file.path(dn, "natlongsurv.templ.xlsx"),
             long = TRUE, max.levels = 15, varlab = TRUE, sort = TRUE), 10)

list.files(dn)




