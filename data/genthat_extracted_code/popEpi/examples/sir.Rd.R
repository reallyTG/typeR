library(popEpi)


### Name: sir
### Title: Calculate SIR or SMR
### Aliases: sir

### ** Examples

data(popmort)
data(sire)
c <- lexpand( sire, status = status, birth = bi_date, exit = ex_date, entry = dg_date,
              breaks = list(per = 1950:2013, age = 1:100, fot = c(0,10,20,Inf)), 
              aggre = list(fot, agegroup = age, year = per, sex) )
## SMR due other causes: status = 2
se <- sir( coh.data = c, coh.obs = 'from0to2', coh.pyrs = 'pyrs', 
           ref.data = popmort, ref.rate = 'haz', 
           adjust = c('agegroup', 'year', 'sex'), print = 'fot')
se
## for examples see: vignette('sir')





