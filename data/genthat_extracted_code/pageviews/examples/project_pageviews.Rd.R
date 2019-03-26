library(pageviews)


### Name: project_pageviews
### Title: Retrieve Per-Project Pageview Counts
### Aliases: project_pageviews

### ** Examples

# Basic call
enwiki_1_october_pageviews <- project_pageviews()

# Break it down to hourly
enwiki_hourly <- project_pageviews(granularity = "hourly", end = "2015100123")




