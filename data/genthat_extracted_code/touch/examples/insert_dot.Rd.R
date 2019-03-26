library(touch)


### Name: insert_dot
### Title: Insert Dot to ICD-9 and ICD-10 Diagnosis Codes
### Aliases: insert_dot

### ** Examples

library(touch)

## for ICD-9 codes
icd9codes <- c("0011", "001.1", "316", "E950", "E9808", "V90", "v100")
insert_dot(icd9codes, 9)

## for ICD-10 codes
icd10codes <- c("A010", "M61019", "p52", "p528")
insert_dot(icd10codes)



