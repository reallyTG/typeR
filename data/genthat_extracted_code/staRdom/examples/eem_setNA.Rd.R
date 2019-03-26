library(staRdom)


### Name: eem_setNA
### Title: set parts of specific samples to NA and optionally interpolate
###   these parts
### Aliases: eem_setNA

### ** Examples

data(eem_list)
eem <- eem_list[1:9]
class(eem) <- "eemlist"

ggeem(eem)

eem_list2 <- eem_setNA(eem,ex=200:280,em=500:600, interpolate=FALSE)
ggeem(eem_list2)



