library(spdownscale)


### Name: ResVal
### Title: Validation Summary
### Aliases: ResVal

### ** Examples


#subsetting dat_model
   mod_calibration=subset(data_model,(year==2003|year==2005|year==2007|year==2009|year==2011))
   mod_validation= subset(data_model,(year==2004|year==2006|year==2008|year==2010|year==2012))
#subsetting data_observation
   obs_calibration=subset(data_observation,(year==2003|year==2005|year==2007|year==2009|year==2011))
   obs_validation=subset(data_observation,(year==2004|year==2006|year==2008|year==2010|year==2012))
#creating the input vectors
   obs_c=obs_calibration$pr
   mod_c=mod_calibration$pr
   obs_v=obs_validation$pr
   mod_v=mod_validation$pr
   mod_fut= data_model_future$pr

   ResVal(obs_c,mod_c,obs_v,mod_v,mod_fut)



