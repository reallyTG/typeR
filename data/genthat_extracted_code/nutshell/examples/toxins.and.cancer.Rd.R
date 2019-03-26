library(nutshell)


### Name: toxins.and.cancer
### Title: Toxins and Cancer
### Aliases: toxins.and.cancer
### Keywords: datasets

### ** Examples

data(toxins.and.cancer)
attach(toxins.and.cancer)
plot(total_toxic_chemicals/Surface_Area,deaths_total/Population)
plot(air_on_site/Surface_Area,deaths_lung/Population)



