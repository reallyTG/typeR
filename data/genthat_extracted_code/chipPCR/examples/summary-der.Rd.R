library(chipPCR)


### Name: summary-der
### Title: Summary 'der' objects
### Aliases: summary.der summary-der summary,der-method
### Keywords: manip

### ** Examples


res <- AmpSim(cyc = 1:40, Cq = 25)
test.der <- inder(res)
#just print summary
summary(test.der)
#print without rounding
summary(test.der, digits = 6)

#assign summary to variable without printing and 
vals <- summary(test.der, print = FALSE)
print(vals)

#easily access different values
vals["bg.start"]



