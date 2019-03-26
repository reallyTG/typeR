library(raws.profile)


### Name: aws_profile
### Title: User profile configuration
### Aliases: aws_profile create_profile profile_settings

### ** Examples

## Not run: 
##D # To run these examples you need the AWS CLI, use
##D # aws_cli_install() if it is not installed.
##D 
##D # create a default user
##D create_profile(access_key = "my_access_key_1",
##D                secret_key = "123456789",
##D                region = "us-east-1" )
##D 
##D # verify if the user was created
##D profile_settings()
##D 
##D # you can also create a user with a profile name
##D create_profile(profile = "profile_name",
##D                access_key = "my_access_key_2",
##D                secret_key = "987654321",
##D                region = "us-west-1")
##D 
##D # verify if the user was created
##D profile_settings(profile = "profile_name")
##D 
##D # remove your credentials from this computer
##D delete_all_profiles()
## End(Not run)




