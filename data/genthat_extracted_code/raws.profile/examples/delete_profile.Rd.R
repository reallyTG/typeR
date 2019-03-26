library(raws.profile)


### Name: delete_profile
### Title: Delete profiles
### Aliases: delete_profile delete_all_profiles

### ** Examples

## Not run: 
##D # To run these examples you need the AWS CLI, use
##D # aws_cli_install() if it is not installed.
##D 
##D # default user
##D create_profile(access_key = "my_access_key_1",
##D                secret_key = "123456789",
##D                region = "us-east-1")
##D 
##D # profile_name1
##D create_profile(profile = "profile_name1",
##D                access_key = "my_access_key_2",
##D                secret_key = "987654321",
##D                region = "us-west-1")
##D 
##D # profile_name2
##D create_profile(profile = "profile_name2",
##D                access_key = "my_access_key_3",
##D                secret_key = "12344321",
##D                region = "us-west-1")
##D 
##D # profile_name3
##D create_profile(profile = "profile_name3",
##D                access_key = "my_access_key_3",
##D                secret_key = "98766789",
##D                region = "us-east-1")
##D 
##D # profile_name4
##D create_profile(profile = "profile_name4",
##D                access_key = "my_access_key_4",
##D                secret_key = "192837465",
##D                region = "us-west-1")
##D 
##D # profile_name5
##D create_profile(profile = "profile_name5",
##D                access_key = "my_access_key_5",
##D                secret_key = "546372819",
##D                region = "us-east-1")
##D 
##D # delete default profile
##D delete_profile()
##D 
##D # delete one profile
##D delete_profile("profile_name1")
##D 
##D # delete two profiles
##D delete_profile(c("profile_name2", "profile_name3"))
##D 
##D # remove your credentials from this computer
##D delete_all_profiles()
## End(Not run)



