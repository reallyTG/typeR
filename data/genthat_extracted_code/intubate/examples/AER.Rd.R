library(intubate)


### Name: AER
### Title: Interfaces for AER package for data science pipelines.
### Aliases: ntbt_ivreg ntbt_tobit
### Keywords: intubate magrittr AER ivreg tobit

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(AER)
##D 
##D 
##D ## ntbt_ivreg: Instrumental-Variable Regression
##D data("CigarettesSW", package = "AER")
##D CigarettesSW$rprice <- with(CigarettesSW, price/cpi)
##D CigarettesSW$rincome <- with(CigarettesSW, income/population/cpi)
##D CigarettesSW$tdiff <- with(CigarettesSW, (taxs - tax)/cpi)
##D 
##D ## Original function to interface
##D ivreg(log(packs) ~ log(rprice) + log(rincome) | log(rincome) + tdiff + I(tax/cpi),
##D       data = CigarettesSW, subset = year == "1995")
##D 
##D ## The interface puts data as first parameter
##D ntbt_ivreg(CigarettesSW,
##D            log(packs) ~ log(rprice) + log(rincome) | log(rincome) + tdiff + I(tax/cpi),
##D            subset = year == "1995")
##D 
##D ## so it can be used easily in a pipeline.
##D CigarettesSW %>%
##D   ntbt_ivreg(log(packs) ~ log(rprice) + log(rincome) | log(rincome) + tdiff + I(tax/cpi),
##D              subset = year == "1995")
##D 
##D 
##D ## ntbt_tobit: Tobit Regression
##D data("Affairs")
##D 
##D ## Original function to interface
##D tobit(affairs ~ age + yearsmarried + religiousness + occupation + rating,
##D       data = Affairs)
##D 
##D ## The interface puts data as first parameter
##D ntbt_tobit(Affairs,
##D            affairs ~ age + yearsmarried + religiousness + occupation + rating)
##D 
##D ## so it can be used easily in a pipeline.
##D Affairs %>%
##D   ntbt_tobit(affairs ~ age + yearsmarried + religiousness + occupation + rating)
## End(Not run)



