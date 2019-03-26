library(secret)


### Name: add_travis_user
### Title: Add a user via their Travis repo.
### Aliases: add_travis_user

### ** Examples

vault <- file.path(tempdir(), ".vault")
create_vault(vault)

add_travis_user("gaborcsardi/secret", vault = vault)
list_users(vault = vault)
delete_user("travis-gaborcsardi-secret", vault = vault)



