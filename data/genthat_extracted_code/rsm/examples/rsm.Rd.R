library(rsm)


### Name: rsm
### Title: Response-surface regression
### Aliases: rsm summary.rsm print.summary.rsm loftest codings.rsm
###   canonical xs recover_data.rsm emm_basis.rsm
### Keywords: regression

### ** Examples

library(rsm)
CR <- coded.data (ChemReact, x1~(Time-85)/5, x2~(Temp-175)/5)

### 1st-order model, using only the first block
CR.rs1 <- rsm (Yield ~ FO(x1,x2), data=CR, subset=1:7) 
summary(CR.rs1)

### 2nd-order model, using both blocks
CR.rs2 <- rsm (Yield ~ Block + SO(x1,x2), data=CR) 
summary(CR.rs2)

### Example of a rising-ridge situation from Montgomery et al, Table 6.2
RRex <- ccd(Response~A+B, n0=c(0,3), alpha="face", randomize=FALSE, oneblock=TRUE)
RRex$Response <- c(52.3, 5.3, 46.7, 44.2, 58.5, 33.5, 32.8, 49.2, 49.3, 50.2, 51.6)
RRex.rsm <- rsm(Response ~ SO(A,B), data = RRex)
canonical(RRex.rsm)
canonical(RRex.rsm, threshold = 1)  # xs is MUCH closer to the experiment

## Not run: 
##D # Illustration of emmeans support
##D emmeans::emmeans(CR.rs2, ~ x1 * x2, mode = "coded", 
##D         at = list(x1 = c(-1, 0, 1), x2 = c(-2, 2)))
##D         
##D # The following will yield the same results:
##D emmeans::emmeans(CR.rs2, ~ Time * Temp, mode = "decoded", 
##D         at = list(Time = c(80, 85, 90), Temp = c(165, 185)))
## End(Not run)



