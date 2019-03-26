library(jcext)


### Name: classification_jc
### Title: classification_jc
### Aliases: classification_jc

### ** Examples

# Load data
data(press)
mslp  <- press$msl
loni  <- press$loni
lati  <- press$lati
times <- press$dates
# Define a central point
centralp <- c(10,50)
# Get the scheme for the  central point
grid16 <- get_jcpoints(10,50)[1:16]
classification_jc(mslp, grid16, centralp, loni, lati, times, gale=FALSE)




