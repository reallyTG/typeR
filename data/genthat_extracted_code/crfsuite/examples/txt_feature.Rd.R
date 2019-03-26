library(crfsuite)


### Name: txt_feature
### Title: Extract basic text features which are useful for entity
###   recognition
### Aliases: txt_feature

### ** Examples

txt_feature("Red Devils", type = "is_capitalised")
txt_feature("red devils", type = "is_capitalised")
txt_feature("http://www.bnosac.be", type = "is_url")
txt_feature("info@google.com", type = "is_email")
txt_feature("hi there", type = "is_email")
txt_feature("1230000", type = "is_number")
txt_feature("123.15", type = "is_number")
txt_feature("123,15", type = "is_number")
txt_feature("123abc", type = "is_number")



