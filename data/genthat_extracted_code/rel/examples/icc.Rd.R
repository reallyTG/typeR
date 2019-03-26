library(rel)


### Name: icc
### Title: Intraclass correlation coefficients
### Aliases: icc
### Keywords: univar

### ** Examples

#Sample data: 200 subjects rated their weight twice.
data <- cbind(sample(50:100,200,replace=TRUE), sample(50:100,200,replace=TRUE))

#ICC based on a two-way random effects model of absolute agreement for a single observation
icc(data=data, model = "two", type = "agreement", measure ="single", conf.level=0.95)



