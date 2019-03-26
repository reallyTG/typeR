library(RAppArmor)


### Name: apparmor
### Title: Change hats
### Aliases: apparmor aa_change_hat aa_revert_hat aa_change_profile
###   aa_find_mountpoint aa_getcon aa_is_enabled aa_is_compiled

### ** Examples

## Not run: 
##D aa_change_profile("testprofile");
##D aa_getcon();
##D test <- read.table("/etc/group");
##D aa_change_hat("testhat", 13337);
##D aa_getcon();
##D test <- read.table("/etc/group");
##D aa_revert_hat(13337);
##D test <- read.table("/etc/group");
## End(Not run)
 ## Not run: 
##D test <- read.table("/etc/passwd");
##D aa_change_profile("testprofile");
##D aa_getcon();
##D test <- read.table("/etc/passwd");
## End(Not run)



