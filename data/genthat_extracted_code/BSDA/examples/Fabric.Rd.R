library(BSDA)


### Name: Fabric
### Title: Measures of softness of ten different clothing garments washed
###   with and without a softener
### Aliases: Fabric
### Keywords: datasets

### ** Examples


wilcox.test(softness ~ softner, data = Fabric, 
            paired = TRUE, alternative = "greater")

## Not run: 
##D library(tidyr)
##D T7 <- tidyr::spread(Fabric, softner, softness) %>% 
##D mutate(di = with - without, adi = abs(di), rk = rank(adi), 
##D        srk = sign(di)*rk)
##D T7
##D t.test(T7$srk, alternative = "greater")
## End(Not run)



