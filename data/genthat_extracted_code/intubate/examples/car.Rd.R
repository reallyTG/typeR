library(intubate)


### Name: car
### Title: Interfaces for car package for data science pipelines.
### Aliases: ntbt_Boxplot ntbt_boxTidwell ntbt_densityPlot ntbt_invTranPlot
###   ntbt_leveneTest ntbt_powerTransform ntbt_scatter3d ntbt_scatterplot
###   ntbt_scatterplotMatrix ntbt_spreadLevelPlot ntbt_symbox
### Keywords: intubate magrittr car Boxplot boxTidwell densityPlot
###   invTranPlot leveneTest powerTransform scatter3d scatterplot
###   scatterplotMatrix spreadLevelPlot symbox

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(car)
##D 
##D ## ntbt_Boxplot: Boxplots With Point Identification
##D ## Original function to interface
##D Boxplot(income ~ type, data = Prestige)
##D 
##D ## The interface puts data as first parameter
##D ntbt_Boxplot(Prestige, income ~ type)
##D 
##D ## so it can be used easily in a pipeline.
##D Prestige %>%
##D   ntbt_Boxplot(income ~ type)
##D 
##D 
##D ## ntbt_boxTidwell: Box-Tidwell Transformations
##D ## Original function to interface
##D boxTidwell(prestige ~ income + education, ~ type + poly(women, 2), data = Prestige)
##D 
##D ## The interface puts data as first parameter
##D ntbt_boxTidwell(Prestige, prestige ~ income + education, ~ type + poly(women, 2))
##D 
##D ## so it can be used easily in a pipeline.
##D Prestige %>%
##D   ntbt_boxTidwell(prestige ~ income + education, ~ type + poly(women, 2))
##D 
##D 
##D ## ntbt_densityPlot: Nonparametric Density Estimates
##D ## Original function to interface
##D densityPlot(income ~ type, data = Prestige)
##D 
##D ## The interface puts data as first parameter
##D ntbt_densityPlot(Prestige, income ~ type)
##D 
##D ## so it can be used easily in a pipeline.
##D Prestige %>%
##D   ntbt_densityPlot(income ~ type)
##D 
##D 
##D ## ntbt_invTranPlot: Choose a Predictor Transformation Visually or Numerically
##D ## Original function to interface
##D invTranPlot(infant.mortality ~ gdp, data = UN)
##D 
##D ## The interface puts data as first parameter
##D ntbt_invTranPlot(UN, infant.mortality ~ gdp)
##D 
##D ## so it can be used easily in a pipeline.
##D UN %>%
##D   ntbt_invTranPlot(infant.mortality ~ gdp)
##D 
##D ## ntbt_leveneTest: Levene's test for homogeneity of variance across groups
##D ## Original function to interface
##D leveneTest(conformity ~ fcategory*partner.status, data = Moore)
##D 
##D ## The interface puts data as first parameter
##D ntbt_leveneTest(Moore, conformity ~ fcategory*partner.status)
##D 
##D ## so it can be used easily in a pipeline.
##D Moore %>%
##D   ntbt_leveneTest(conformity ~ fcategory*partner.status)
##D 
##D ## ntbt_powerTransform: Finding Univariate or Multivariate Power Transformations
##D ## Original function to interface
##D powerTransform(cycles ~ len + amp + load, Wool)
##D 
##D ## The interface puts data as first parameter
##D ntbt_powerTransform(Wool, cycles ~ len + amp + load)
##D 
##D ## so it can be used easily in a pipeline.
##D Wool %>%
##D   ntbt_powerTransform(cycles ~ len + amp + load)
##D 
##D 
##D ## ntbt_scatter3d: Three-Dimensional Scatterplots and Point Identification
##D ## Original function to interface
##D ## NOTE: need rgl, mgcv, and interactive mode. Commented out.
##D #scatter3d(prestige ~ income + education, data = Duncan)
##D 
##D ## The interface puts data as first parameter
##D #ntbt_scatter3d(Duncan, prestige ~ income + education)
##D 
##D ## so it can be used easily in a pipeline.
##D #Duncan %>%
##D #  ntbt_scatter3d(prestige ~ income + education)
##D 
##D 
##D ## ntbt_scatterplot: Scatterplots with Boxplots
##D ## Original function to interface
##D scatterplot(prestige ~ income, data = Prestige, ellipse = TRUE)
##D 
##D ## The interface puts data as first parameter
##D ntbt_scatterplot(Prestige, prestige ~ income, ellipse = TRUE)
##D 
##D ## so it can be used easily in a pipeline.
##D Prestige %>%
##D   ntbt_scatterplot(prestige ~ income, ellipse = TRUE)
##D 
##D ## ntbt_scatterplotMatrix: Scatterplot Matrices
##D ## Original function to interface
##D scatterplotMatrix(~ income + education + prestige | type, data = Duncan)
##D 
##D ## The interface puts data as first parameter
##D ntbt_scatterplotMatrix(Duncan, ~ income + education + prestige | type)
##D 
##D ## so it can be used easily in a pipeline.
##D Duncan %>%
##D   ntbt_scatterplotMatrix(~ income + education + prestige | type)
##D 
##D ## ntbt_spreadLevelPlot: Spread-Level Plots
##D ## Original function to interface
##D spreadLevelPlot(interlocks + 1 ~ nation, data = Ornstein)
##D 
##D ## The interface puts data as first parameter
##D ntbt_spreadLevelPlot(Ornstein, interlocks + 1 ~ nation)
##D 
##D ## so it can be used easily in a pipeline.
##D Ornstein %>%
##D   ntbt_spreadLevelPlot(interlocks + 1 ~ nation)
##D 
##D ## ntbt_symbox: Boxplots for transformations to symmetry
##D ## Original function to interface
##D symbox(~ income, data = Prestige)
##D 
##D ## The interface puts data as first parameter
##D ntbt_symbox(Prestige, ~ income)
##D 
##D ## so it can be used easily in a pipeline.
##D Prestige %>%
##D   ntbt_symbox(~ income)
## End(Not run)



