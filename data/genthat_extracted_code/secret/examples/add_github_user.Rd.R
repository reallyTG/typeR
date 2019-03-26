library(secret)


### Name: add_github_user
### Title: Add a user via their GitHub username.
### Aliases: add_github_user

### ** Examples

vault <- file.path(tempdir(), ".vault")
create_vault(vault)

add_github_user("hadley", vault = vault)
list_users(vault = vault)
delete_user("github-hadley", vault = vault)



