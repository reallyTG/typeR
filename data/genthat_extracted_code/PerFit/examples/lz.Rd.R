library(PerFit)


### Name: lz, lzstar
### Title: lz and lzstar person-fit statistics
### Aliases: lz lzstar
### Keywords: univar

### ** Examples

# Load the inadequacy scale data (dichotomous item scores):
data(InadequacyData)

# Compute the lz scores using a subsample of the first 200 response vectors:
lz.out <- lz(InadequacyData[1:200,])
# Use parameters estimated externally (in this case item parameters estimated by mirt):
mod <- mirt(InadequacyData[1:200,], 1)
ip.mirt <- coef(mod, IRTpars = TRUE, simplify = TRUE, digits = Inf)$items[,c('a', 'b', 'g')]
lz.out2 <- lz(InadequacyData[1:200,], IP = ip.mirt)

# Compute the lzstar scores using a subsample of the first 200 response vectors:
lzstar.out <- lzstar(InadequacyData[1:200,])



