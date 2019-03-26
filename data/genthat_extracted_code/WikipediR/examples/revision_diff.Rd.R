library(WikipediR)


### Name: revision_diff
### Title: Generates a "diff" between a pair of revisions
### Aliases: revision_diff

### ** Examples


#Wikimedia diff
wp_diff <- revision_diff("en","wikipedia", revisions = 552373187, direction = "next")

#Non-Wikimedia diff
rw_diff <- revision_diff(domain = "rationalwiki.org", revisions = 88616, direction = "next")



