library(fields)


### Name: BD
### Title: Data frame of the effect of buffer compositions on DNA strand
###   displacement amplification. A 4-d regression data set with with
###   replication. This is a useful test data set for exercising function
###   fitting methods.
### Aliases: BD
### Keywords: datasets

### ** Examples

# fitting a DNA strand 
# displacement amplification  surface to various buffer compositions 
fit<- Tps(BD[,1:4],BD$lnya,scale.type="range") 
surface(fit)  # plots fitted surface and contours 



