library(kidney.epi)


### Name: ktx.kdpi.optn
### Title: Calculate KDRI and KDPI for deceased kidney donor
### Aliases: ktx.kdpi.optn

### ** Examples

ktx.kdpi.optn (age = 60, height_cm = 168, weight_kg = 93, ethnicity = "White",
  hypertension = "yes", diabetes = "no", causeofdeath = "roadinjury",
  creatinine = 1.4, hcv = "negative", dcdstatus = "no",
  creatinineunits = "mg/dl", return_output_type = "KDRI_Rao")
ktx.kdpi.optn (age = 30, height_cm = 176, weight_kg = 82, ethnicity = "White", 
  hypertension = "NA", diabetes = "no", causeofdeath = "roadinjury", 
  creatinine = 150, hcv = "negative", dcdstatus = "no", return_output_type = "KDPI")



