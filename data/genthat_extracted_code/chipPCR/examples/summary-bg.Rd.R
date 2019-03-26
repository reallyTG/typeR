library(chipPCR)


### Name: summary-bg
### Title: Summary 'bg' objects
### Aliases: summary.bg summary,bg-method
### Keywords: manip

### ** Examples


res <- AmpSim(cyc = 1:40, Cq = 25)
background <- bg.max(res[, 1], res[, 2])
#just print summary
summary(background)

#assign summary to variable without printing
vals <- summary(background, print = FALSE)
print(vals)

#easily access different values
vals["FDM"]



