library(scales)


### Name: hms_trans
### Title: Transformation for times (class hms).
### Aliases: hms_trans

### ** Examples

if (require("hms")) {
hms <- round(runif(10) * 86400)
t <- hms_trans()
t$transform(hms)
t$inverse(t$transform(hms))
t$breaks(hms)
}



