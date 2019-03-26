library(atlantistools)


### Name: combine_groups
### Title: Combine values from different groups if specific groups only
###   have a low contribution to the overall value.
### Aliases: combine_groups

### ** Examples

df <- combine_groups(ref_dm, group_col = "prey")
df <- combine_groups(ref_dm, group_col = "prey", combine_thresh = 2)



