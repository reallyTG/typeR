library(vcfR)


### Name: Convert to tidy data frames
### Title: Convert vcfR objects to tidy data frames
### Aliases: 'Convert to tidy data frames' vcfR2tidy extract_info_tidy
###   extract_gt_tidy vcf_field_names

### ** Examples

# load the data
data("vcfR_test")
vcf <- vcfR_test


# extract all the INFO and FORMAT fields into a list of tidy
# data frames: fix, gt, and meta. Here we don't coerce columns
# to integer or numeric types...
Z <- vcfR2tidy(vcf)
names(Z)


# here is the meta data in a table
Z$meta


# here is the fixed info
Z$fix


# here are the GT fields.  Note that ChromKey and POS are keys
# back to Z$fix
Z$gt


# Note that if you wanted to tidy this data set even further
# you could break up the comma-delimited columns easily
# using tidyr::separate




# here we put the data into a single, joined data frame (list component
# dat in the returned list) and the meta data.  Let's just pick out a 
# few fields:
vcfR2tidy(vcf, 
          single_frame = TRUE, 
          info_fields = c("AC", "AN", "MQ"), 
          format_fields = c("GT", "PL"))


# note that the "gt_GT_alleles" column is always returned when any
# FORMAT fields are extracted.




# Here we extract a single frame with all fields but we automatically change
# types of the columns according to the entries in the metadata.
vcfR2tidy(vcf, single_frame = TRUE, info_types = TRUE, format_types = TRUE)




# for comparison, here note that all the INFO and FORMAT fields that were
# extracted are left as character ("chr" in the dplyr summary)
vcfR2tidy(vcf, single_frame = TRUE)





# Below are some examples with the vcfR2tidy "subfunctions"


# extract the AC, AN, and MQ fields from the INFO column into
# a data frame and convert the AN values integers and the MQ
# values into numerics.
extract_info_tidy(vcf, info_fields = c("AC", "AN", "MQ"), info_types = c(AN = "i", MQ = "n"))

# extract all fields from the INFO column but leave 
# them as character vectors
extract_info_tidy(vcf)

# extract all fields from the INFO column and coerce 
# types according to metadata info
extract_info_tidy(vcf, info_types = TRUE)

# get the INFO field metadata in a data frame
vcf_field_names(vcf, tag = "INFO")

# get the FORMAT field metadata in a data frame
vcf_field_names(vcf, tag = "FORMAT")






