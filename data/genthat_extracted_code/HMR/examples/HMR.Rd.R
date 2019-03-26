library(HMR)


### Name: HMR
### Title: Flux estimation with static chamber data
### Aliases: HMR
### Keywords: htest regression nonlinear

### ** Examples

## Not run: 
##D # Suppose the sample data above are located on a Windows machine
##D # in the file 'C:\My HMR applications\N2O.csv'.
##D 
##D # Start by setting the data file folder:
##D setwd('C:/My HMR applications')
##D 
##D # Notice that R uses '/' in folder declarations, whereas
##D # Windows uses '\'.
##D 
##D # Analyse all data series:
##D HMR(filename='N2O.csv')
##D 
##D # Produces the following output:
##D   Series         f0      f0.se       f0.p     f0.lo95    f0.up95 Method Warning
##D 1    k0a 2.5968E+01 4.5356E+00 2.8500E-04  1.5708E+01 3.6229E+01    HMR    None
##D 2    k0d 1.8720E+01 4.1881E+00 2.0842E-03  9.0617E+00 2.8377E+01    HMR    None
##D 3   F1T3 2.1265E+02 3.6719E+01 1.1605E-03  1.2280E+02 3.0250E+02    HMR    None
##D 4   F2T2 4.5093E+01 1.4702E+01 5.4691E-02 -1.6971E+00 9.1882E+01    HMR    None
##D 5   F2V2 5.5853E+01 3.5905E+00 9.9703E-05  4.5884E+01 6.5822E+01     LR    None
##D 
##D # The output is also exported to the semicolon-separated file
##D # 'C:\My HMR applications\HMR - N2O.csv'.
##D 
##D # Analyse data series 'k0a' and 'k0d' and export model predicted
##D # chamber concentrations:
##D HMR(filename=datafile,series=c('k0a','k0d'),PHMR=TRUE)
##D 
##D # The model predicted concentrations are exported to the file
##D # 'C:\My HMR applications\PHMR - N2O.csv'.
##D 
##D # Analyse all data series with both linear regression and the
##D # user selected analysis:
##D HMR(filename='N2O.csv',LR.always=TRUE)
##D 
##D # Produces the following (slightly edited) output:
##D   Series         f0      f0.se       f0.p     f0.lo95    f0.up95 Method Warning...
##D 1    k0a 2.5968E+01 4.5356E+00 2.8500E-04  1.5708E+01 3.6229E+01    HMR    None...
##D 2    k0d 1.8720E+01 4.1881E+00 2.0842E-03  9.0617E+00 2.8377E+01    HMR    None...
##D 3   F1T3 2.1265E+02 3.6719E+01 1.1605E-03  1.2280E+02 3.0250E+02    HMR    None...
##D 4   F2T2 4.5093E+01 1.4702E+01 5.4691E-02 -1.6971E+00 9.1882E+01    HMR    None...
##D 5   F2V2 5.5853E+01 3.5905E+00 9.9703E-05  4.5884E+01 6.5822E+01     LR    None...
##D 
##D ...      LR.f0   LR.f0.se    LR.f0.p LR.f0.lo95 LR.f0.up95 LR.Warning
##D ... 8.9948E+00 1.1729E+00 1.7021E-05 6.3813E+00 1.1608E+01       None
##D ... 8.0045E+00 1.0199E+00 2.5776E-05 5.6974E+00 1.0312E+01       None
##D ... 5.0291E+01 9.9206E+00 1.4481E-03 2.6833E+01 7.3750E+01       None
##D ... 1.2259E+01 2.9792E+00 1.4675E-02 3.9872E+00 2.0531E+01       None
##D ... 5.5853E+01 3.5905E+00 9.9703E-05 4.5884E+01 6.5822E+01       None
##D 
##D # The output is also exported to the semicolon-separated file
##D # 'C:\My HMR applications\HMR - N2O.csv'. Hence, several analyses
##D # of the same data file overwrites the output file, so to save a
##D # particular output file it has to be renamed before the next
##D # application of HMR to the same data file.
## End(Not run)



