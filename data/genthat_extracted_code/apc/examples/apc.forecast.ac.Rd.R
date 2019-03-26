library(apc)


### Name: apc.forecast.ac
### Title: Forecast for Poisson response model with AC structure.
### Aliases: apc.forecast.ac

### ** Examples

#####################
#  EXAMPLE with reserving data: data.loss.VNJ()
#  Data used in Martinez Miranda, Nielsen, Nielsen and Verrall (2011)
#  Point forecasts are the Chain-Ladder forecasts	
#  *NOTE* Data are over-dispersed,
#		so distribution forecast are *NOT* reliable
#  The same could be done data.asbestos(),
#		which are not over-dispersed
#		see vignette.

data	<- data.loss.VNJ()
fit.ac	<- apc.fit.model(data,"poisson.response","AC")
forecast	<- apc.forecast.ac(fit.ac)

#	forecasts by "policy-year"
forecast$response.forecast.coh
#	          forecast         se    se.proc     se.est
#	coh_2     1684.763   57.69067   41.04586   40.53949
#	coh_3    29379.085  220.53214  171.40328  138.76362
#	coh_4    60637.929  313.33867  246.24770  193.76066
#	coh_5   101157.697  385.69930  318.05298  218.18857
#	coh_6   173801.522  501.42184  416.89510  278.60786
#	coh_7   249348.589  595.21937  499.34816  323.94060
#	coh_8   475991.739  864.06580  689.92155  520.20955
#	coh_9   763918.643 1182.70450  874.02440  796.78810
#	coh_10 1459859.526 2216.80272 1208.24647 1858.58945

#	forecasts of "cash-flow"
forecast$response.forecast.per
#	reproduces Table 6 of MMNNV (2011)
#	         forecast         se    se.proc   se.est
#	per_11 1353858.32 1456.92459 1163.55417 876.7958
#	per_12  754180.12 1017.37629  868.43544 529.9758
#	per_13  488612.42  816.62860  699.00817 422.2202
#	per_14  318043.00  664.36135  563.95302 351.1880
#	per_15  184610.86  508.97704  429.66366 272.8494
#	per_16  115022.56  414.64945  339.14976 238.5615
#	per_17   63145.15  320.93564  251.28700 199.6360
#	per_18   35812.79  255.08766  189.24267 171.0466
#	per_19    2494.27   78.10439   49.94266  60.0502

#	forecast  of "total reserve"
#	reproduces Table 6 of MMNNV (2011)
forecast$response.forecast.all
#	    forecast       se  se.proc   se.est
#	all  3315779 3182.737 1820.928 2610.371

#####################
#	Forecast of cashflows for 7th cohort (policy year)
#	Note a series of warnings are given because 
#		this is done by truncating the data
#		which generates the warnings associated
#		with apc.data.list.subset()
forecast<- apc.forecast.ac(fit.ac,sum.per.by.coh=7)
forecast$response.forecast.per.by.coh
#	         forecast        se   se.proc    se.est
#	per_11 102975.337 355.97444 320.89771 154.08590
#	per_12  58061.306 267.24671 240.95914 115.58329
#	per_13  40466.866 226.40049 201.16378 103.87646
#	per_14  21615.765 170.90637 147.02301  87.13910
#	per_15  24410.927 194.70158 156.23997 116.17994
#	per_16   1818.389  61.09857  42.64257  43.75668
#
#	This can also be intercept corrected
#		Such intercept corrections are useful when
#		analysing data.asbestos().
#		Unclear if they are useful for
#		reserving.
forecast$intercept.correction.per.by.coh
#   > [1] 1.241798
forecast$response.forecast.per.by.coh.ic
#	         forecast        se   se.proc    se.est
#	per_11 127874.573 355.97444 320.89771 154.08590
#	per_12  72100.417 267.24671 240.95914 115.58329
#	per_13  50251.675 226.40049 201.16378 103.87646
#	per_14  26842.415 170.90637 147.02301  87.13910
#	per_15  30313.441 194.70158 156.23997 116.17994
#	per_16   2258.071  61.09857  42.64257  43.75668

#####################
#	Forecast of cashflows cumulated for
#		6th and 7th cohort (policy year)
forecast<- apc.forecast.ac(fit.ac,sum.per.by.coh=c(6,7))
forecast$response.forecast.per.by.coh.ic
#	         forecast        se   se.proc    se.est
#	per_11 226219.380 460.52781 414.62816 200.42295
#	per_12 139628.153 366.48699 325.74697 167.93339
#	per_13  87022.435 295.86605 257.16360 146.29970
#	per_14  66584.160 277.64858 224.94656 162.75067
#	per_15  34962.678 206.77289 163.00324 127.22018
#	per_16   2392.759  61.09857  42.64257  43.75668

#####################
#  EXAMPLE with reserving data: data.loss.TA()
#  Data used in Harnau and Nielsen (2016)
data	<- data.loss.TA()
fit.ac	<- apc.fit.model(data,"od.poisson.response","AC")
forecast	<- apc.forecast.ac(fit.ac,quantiles=c(0.01,0.05,0.5,0.95,0.99))
forecast$response.forecast.all
#	    forecast      se se.proc  se.est  tau.est 
#	all 18680856 2675417 1007826 2474680 134561.2
#	...
#	 t-0.010  t-0.050  t-0.500  t-0.950  t-0.990 
#	12158931 14160544 18680856 23201167 25202781
#	...
#	 G-0.010  G-0.050  G-0.500  G-0.950  G-0.990 
#	12760202 14398564 18553290 23417098 25792423 
forecast$response.forecast.per





