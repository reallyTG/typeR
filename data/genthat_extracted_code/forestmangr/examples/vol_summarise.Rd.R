library(forestmangr)


### Name: vol_summarise
### Title: Summarize volume of trees
### Aliases: vol_summarise

### ** Examples

library(forestmangr)
data("exfm7")
exfm7

# In order to calculate the volume of each tree, first we
# Calculate the volume by tree section using the Smalian method:
sec_data_vol <- exfm7 %>% 
smalianwb("di_wb", "hi", "TREE") %>% 
smalianwob("di_wb", "hi", "bark_t", "TREE", bt_mm_to_cm = TRUE)

sec_data_vol

# Now, we summarize the tree's volume:
vol_summarise(sec_data_vol, dbh = "DBH", th = "TH", vwb = "VWB",
tree = "TREE", .groups = "STRATA",vwob = "VWOB")

# It's possible to do everything using pipes:
exfm7 %>% 
smalianwb("di_wb", "hi", "TREE") %>% 
smalianwob("di_wb", "hi", "bark_t", "TREE", bt_mm_to_cm = TRUE) %>% 
vol_summarise("DBH", "TH", "VWB", "TREE", "STRATA", "VWOB")




