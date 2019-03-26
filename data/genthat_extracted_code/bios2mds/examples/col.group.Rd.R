library(bios2mds)


### Name: col.group
### Title: Links elements in a mmds object to specific groups and colors
### Aliases: col.group
### Keywords: mmds

### ** Examples

# performing metric MDS on human GPCRs with projection of 
# GPCRs from D. melanogaster as supplementary data:
data(gpcr)
active <- gpcr$dif$sapiens.sapiens
mmds_active <- mmds(active)
mmds_active<-col.group(mmds_active,system.file("csv/human_gpcr_group.csv"
,package = "bios2mds"))



