library(ksrlive)


### Name: KSR.list
### Title: Create a kinase substrate relationship list from a data frame
### Aliases: KSR.list

### ** Examples

data(phosphonetworkdf)
data(datakin)

# first column has to be substrate id, second kinase id
kin_data <- KSR.list(phosphonetwork_df[, c("SUB_IDENT", "KIN_ACC_ID")]) 
# Akt1 and Akt2 belong to the same kinase family, combine their substrates 
# into one list and name the list after the first family member
fam <- list(akt = c("P31749", "P31751"))
kin_data_fam <- KSR.list(phosphonetwork_df[, c("SUB_IDENT", "KIN_ACC_ID")], 
kinasefamilies = fam)

# only include phosphosites appearing once
kin_data_fam_exc <- KSR.list(phosphonetwork_df[, c("SUB_IDENT", "KIN_ACC_ID")], 
                             kinasefamilies = fam,
                             exclusive = TRUE)



