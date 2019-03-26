library(hansard)


### Name: research_briefings
### Title: Parliamentary Research Briefings
### Aliases: research_briefings hansard_research_briefings

### ** Examples

## Not run: 
##D x <- research_briefings("Housing and planning")
##D 
##D # Requests can be made using lists created using `research_topics_list`
##D # and `research_subtopics_list`
##D 
##D research_topics_list <- research_topics_list()
##D 
##D x <- research_briefings(topic = research_topics_list[[7]])
##D 
##D research_subtopics_list <- research_subtopics_list()
##D 
##D x <- research_briefings(subtopic = research_subtopics_list[[7]][10])
##D 
##D # Requests for certain briefing types can also be made using lists
##D # created with `research_types_list`.
##D 
##D research_types_list <- research_types_list()
##D 
##D x <- research_briefings(type = research_types_list[[3]])
## End(Not run)




