library(forestr)


### Name: adjust_by_user
### Title: Adjust by user height
### Aliases: adjust_by_user

### ** Examples

# Adust raw data to account for user height as PCL is user-mounted and correction
# gives actual distance from ground.

pcl_adjusted <- adjust_by_user(pcl_coded, user_height = 1.05)




