library(vstsr)


### Name: vsts_create_release
### Title: Visual Studio Project Release Information
### Aliases: vsts_create_release

### ** Examples

#Add in own details to get a non-NULL output
auth_key <- vsts_auth_key('<username>', '<password>')
art_list <- list(list(alias = 'Art1', instanceReference = list(id = 1)),
                 list(alias = 'Art2', instanceReference = list(id = 2)))
body <- list(definitionId = 1, description = 'R API Release',
             artifacts = I(art_list))
vsts_create_release('domain', 'project', auth_key, body)




