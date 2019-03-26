library(TPMplt)


### Name: TCorrect
### Title: Temperature correction function
### Aliases: TCorrect
### Keywords: AllPF TCorrect

### ** Examples

# Check the raw data
SSplots(TPMdata, 2, mfrow=c(2, 2))

# The split strain conditions for 'TPMdata' can be set as 0.015 and 0.2
x <- AllPF(TPMdata, subsec = c(0.015, 0.2))
SSplots(x, 2, mfrow=c(2, 2))

# Applying aforementioned subsection conditions for all curves,
# using the parameters of steel as example:
x1 <- TCorrect(TPMdata, 3, 2, 510.7896, 8050, CorrCons = 0.9, subsec=c(0.015, 0.2))
SSplots(x1, 2, mfrow=c(2, 2))



