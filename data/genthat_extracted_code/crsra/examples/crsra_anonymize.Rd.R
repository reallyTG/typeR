library(crsra)


### Name: crsra_anonymize
### Title: Anonymizes ID variables (such as Partner hashed user ids)
###   throughout the data set. The function is based on the function
###   'digest' from the package 'digest'.
### Aliases: crsra_anonymize

### ** Examples

res = crsra_anonymize(example_course_import,
col_to_mask = "jhu_user_id",
algorithm = "crc32")



