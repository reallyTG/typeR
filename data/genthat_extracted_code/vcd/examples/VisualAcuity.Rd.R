library(vcd)


### Name: VisualAcuity
### Title: Visual Acuity in Left and Right Eyes
### Aliases: VisualAcuity
### Keywords: datasets

### ** Examples

data("VisualAcuity")
structable(~ gender + left + right, data = VisualAcuity)
sieve(Freq ~ left + right | gender, data = VisualAcuity, shade = TRUE)
cotabplot(Freq ~ left + right | gender, data = VisualAcuity,
          panel = cotab_agreementplot)



