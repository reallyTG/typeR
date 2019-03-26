library(WikipediR)


### Name: revision_content
### Title: Retrieves MediaWiki revisions
### Aliases: revision_content

### ** Examples


#Revision content from a Wikimedia project
wp_content <- revision_content("en","wikipedia", revisions = 552373187)

#Revision content from a non-Wikimedia project
rw_content <- revision_content(domain = "rationalwiki.org", revisions = 88616)



