library(kutils)


### Name: varlabTemplate
### Title: Create Variable Label Template
### Aliases: varlabTemplate

### ** Examples

mydf.path <- system.file("extdata", "mydf.csv", package = "kutils")
mydf <- read.csv(mydf.path, stringsAsFactors=FALSE)
mydf.keywide1 <- keyTemplate(mydf, long = FALSE, sort = FALSE,
                    varlab = TRUE)
attr(mydf.keywide1, "varlab")
mydf.keywide2 <- keyTemplate(mydf, long = FALSE, sort = FALSE,
                    varlab = c("x3" = "fun"))
attr(mydf.keywide2, "varlab")
attr(mydf.keywide2, "varlab") <- varlabTemplate(mydf.keywide2,
                  varlab = c("x5" = "wealth", "x10" = "happy"))
attr(mydf.keywide2, "varlab")
attr(mydf.keywide2, "varlab") <- varlabTemplate(mydf.keywide2,
                  varlab = TRUE)
attr(mydf.keywide2, "varlab")
## Target we are trying to match:
mydf.keylong <- keyTemplate(mydf, long = TRUE, sort = FALSE, varlab = TRUE)
attr(mydf.keylong, "varlab")
attr(mydf.keylong, "varlab") <- NULL
varlabTemplate(mydf.keylong)
attr(mydf.keylong, "varlab") <- varlabTemplate(mydf.keylong,
                   varlab = c("x3" = "wealth", "x10" = "happy"))
attr(mydf.keylong, "varlab")
attr(mydf.keylong, "varlab") <- varlabTemplate(mydf.keylong, varlab = TRUE)
attr(mydf.keylong, "varlab")



