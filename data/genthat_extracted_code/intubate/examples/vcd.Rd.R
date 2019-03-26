library(intubate)


### Name: vcd
### Title: Interfaces for vcd package for data science pipelines.
### Aliases: ntbt_agreementplot ntbt_assoc ntbt_cd_plot ntbt_cotabplot
###   ntbt_loddsratio ntbt_mosaic ntbt_sieve ntbt_spine ntbt_structable
### Keywords: intubate magrittr vcd agreementplot assoc cd_plot cotabplot
###   loddsratio mosaic sieve spine structable

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(vcd)
##D 
##D 
##D ## ntbt_agreementplot: Bangdiwala's Observer Agreement Chart
##D ## Original function to interface
##D agreementplot(Freq ~ Gender + Admit, as.data.frame(UCBAdmissions))
##D 
##D ## The interface puts data as first parameter
##D ntbt_agreementplot(as.data.frame(UCBAdmissions), Freq ~ Gender + Admit)
##D 
##D ## so it can be used easily in a pipeline.
##D as.data.frame(UCBAdmissions) %>%
##D   ntbt_agreementplot(Freq ~ Gender + Admit)
##D 
##D 
##D ## ntbt_assoc: Extended Association Plots
##D ## Original function to interface
##D assoc(Freq ~ Gender + Admit, data = as.data.frame(UCBAdmissions))
##D 
##D ## The interface puts data as first parameter
##D ntbt_assoc(as.data.frame(UCBAdmissions), Freq ~ Gender + Admit)
##D 
##D ## so it can be used easily in a pipeline.
##D as.data.frame(UCBAdmissions) %>%
##D   ntbt_assoc(Freq ~ Gender + Admit)
##D 
##D 
##D ## ntbt_cd_plot: Conditional Density Plots
##D data("Arthritis")
##D ## Original function to interface
##D cd_plot(Improved ~ Age, data = Arthritis)
##D 
##D ## The interface puts data as first parameter
##D ntbt_cd_plot(Arthritis, Improved ~ Age)
##D 
##D ## so it can be used easily in a pipeline.
##D Arthritis %>%
##D   ntbt_cd_plot(Improved ~ Age)
##D 
##D 
##D ## ntbt_cotabplot: Coplot for Contingency Tables
##D ## Original function to interface
##D cotabplot(~ Admit + Gender | Dept, data = UCBAdmissions)
##D 
##D ## The interface puts data as first parameter
##D ntbt_cotabplot(UCBAdmissions, ~ Admit + Gender | Dept)
##D 
##D ## so it can be used easily in a pipeline.
##D UCBAdmissions %>%
##D   ntbt_cotabplot(~ Admit + Gender | Dept)
##D 
##D 
##D ## ntbt_loddsratio: Calculate Generalized Log Odds Ratios for Frequency Tables
##D data(Punishment, package = "vcd")
##D 
##D ## Original function to interface
##D loddsratio(Freq ~ memory + attitude | age + education, data = Punishment)
##D 
##D ## The interface puts data as first parameter
##D ntbt_loddsratio(Punishment, Freq ~ memory + attitude | age + education)
##D 
##D ## so it can be used easily in a pipeline.
##D Punishment %>%
##D   ntbt_loddsratio(Freq ~ memory + attitude | age + education)
##D 
##D 
##D ## ntbt_mosaic: Extended Mosaic Plots
##D library(MASS)
##D data("Titanic")
##D mosaic(Titanic)
##D 
##D ## Original function to interface
##D mosaic(~ Sex + Age + Survived, data = Titanic,
##D        main = "Survival on the Titanic", shade = TRUE, legend = TRUE)
##D 
##D ## The interface puts data as first parameter
##D ntbt_mosaic(Titanic, ~ Sex + Age + Survived,
##D             main = "Survival on the Titanic", shade = TRUE, legend = TRUE)
##D 
##D ## so it can be used easily in a pipeline.
##D Titanic %>%
##D   ntbt_mosaic(~ Sex + Age + Survived,
##D               main = "Survival on the Titanic", shade = TRUE, legend = TRUE)
##D 
##D 
##D ## ntbt_sieve: Extended Sieve Plots
##D data("VisualAcuity")
##D 
##D ## Original function to interface
##D sieve(Freq ~ right + left,  data = VisualAcuity)
##D 
##D ## The interface puts data as first parameter
##D ntbt_sieve(VisualAcuity, Freq ~ right + left)
##D 
##D ## so it can be used easily in a pipeline.
##D VisualAcuity %>%
##D   ntbt_sieve(Freq ~ right + left)
##D 
##D 
##D ## ntbt_spine: Spine Plots and Spinograms
##D data("Arthritis")
##D 
##D ## Original function to interface
##D spine(Improved ~ Treatment, data = Arthritis)
##D 
##D ## The interface puts data as first parameter
##D ntbt_spine(Arthritis, Improved ~ Treatment)
##D 
##D ## so it can be used easily in a pipeline.
##D Arthritis %>%
##D   ntbt_spine(Improved ~ Treatment)
##D 
##D 
##D ## ntbt_structable: Structured Contingency Tables
##D ## Original function to interface
##D structable(Sex + Class ~ Survived + Age, data = Titanic)
##D 
##D ## The interface puts data as first parameter
##D ntbt_structable(Titanic, Sex + Class ~ Survived + Age)
##D 
##D ## so it can be used easily in a pipeline.
##D Titanic %>%
##D   ntbt_structable(Sex + Class ~ Survived + Age)
## End(Not run)



