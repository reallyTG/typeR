library(crsra)


### Name: crsra_delete_user
### Title: Deletes a specific user from all tables in the data in case
###   Coursera data privacy laws require you to delete a specific (or set
###   of) user(s) from your data.
### Aliases: crsra_delete_user

### ** Examples

del_user = example_course_import$users$jhu_user_id[1]
del_user %in% example_course_import$users$jhu_user_id
res = crsra_delete_user(example_course_import, users = del_user)
del_user %in% res$users$jhu_user_id




