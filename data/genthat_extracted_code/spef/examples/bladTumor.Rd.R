library(spef)


### Name: bladTumor
### Title: Bladder Tumors Cancer Recurrences
### Aliases: bladTumor

### ** Examples

data(bladTumor)
## Plot bladder tumor data
p <- plot(with(bladTumor, PanelSurv(subject, time, count2)))
print(p)



