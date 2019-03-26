library(icd)


### Name: comorbid
### Title: Find comorbidities from ICD-9 codes.
### Aliases: comorbid icd10_comorbid icd9_comorbid icd9_comorbid_ahrq
###   icd10_comorbid_ahrq icd9_comorbid_elix icd10_comorbid_elix
###   icd9_comorbid_quan_elix icd10_comorbid_quan_elix
###   icd9_comorbid_quan_deyo icd10_comorbid_quan_deyo
###   icd9_comorbid_charlson icd10_comorbid_charlson comorbid_ccs
###   icd9_comorbid_ccs icd10_comorbid_ccs comorbid_ahrq comorbid_elix
###   comorbid_quan_elix comorbid_quan_deyo comorbid_charlson icd_comorbid
###   icd_comorbid_ahrq icd_comorbid_elix icd_comorbid_hcc
###   icd_comorbid_quan_deyo icd_comorbid_quan_elix

### ** Examples

vermont_dx[1:5, 1:10]
vd <- wide_to_long(vermont_dx)
# get first few rows and columns of Charlson comorbidities using Quan's mapping
comorbid_quan_deyo(vd)[1:5, 1:14]

# get summary AHRQ (based on Elixhauser) comorbidities for ICD-10 Uranium data:
summary(comorbid_ahrq(uranium_pathology))

pts <- icd_long_data(visit_name = c("2", "1", "2", "3", "3"),
                 icd9 = c("39891", "40110", "09322", "41514", "39891"))
comorbid(pts, icd9_map_ahrq, short_code = TRUE) # visit_name is now sorted
pts <- icd_long_data(
           visit_name = c("1", "2", "3", "4", "4"),
           icd_name = c("20084", "1742", "30410", "41514", "95893"),
           date = as.Date(c("2011-01-01", "2011-01-02", "2011-01-03",
             "2011-01-04", "2011-01-04")))

pt_hccs <- comorbid_hcc(pts, date_name = "date")
head(pt_hccs)

pts10 <- icd_long_data(
  visit_name = c("a", "b", "c", "d", "e"),
  icd_name =c("I058", NA, "T82817A", "", "I69369"),
  date = as.Date(
    c("2011-01-01", "2011-01-02", "2011-01-03", "2011-01-03", "2011-01-03")))

icd10_comorbid(pts10, map = icd10_map_ahrq)
# or if library(icd) hasn't been called first:
icd::icd10_comorbid(pts10, map = icd::icd10_map_ahrq)
# or most simply:
icd::icd10_comorbid_ahrq(pts10)

# specify a simple custom comorbidity map:
my_map <- list("malady" = c("100", "2000"),
               "ailment" = c("003", "040"))
two_pts <- data.frame(visit_id = c("v01", "v01", "v02", "v02"),
  icd9 = as.icd9(c("040", "000", "100", "000")),
  stringsAsFactors = FALSE)
comorbid(two_pts, map = my_map)



