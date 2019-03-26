library(googleAnalyticsR)


### Name: segment_ga4
### Title: Make a segment object for use
### Aliases: segment_ga4

### ** Examples


## Not run: 
##D library(googleAnalyticsR)
##D 
##D ## authenticate, 
##D ## or use the RStudio Addin "Google API Auth" with analytics scopes set
##D ga_auth()
##D 
##D ## get your accounts
##D account_list <- google_analytics_account_list()
##D 
##D ## pick a profile with data to query
##D 
##D ga_id <- account_list[23,'viewId']
##D 
##D 
##D ## make a segment element
##D se <- segment_element("sessions", 
##D                       operator = "GREATER_THAN", 
##D                       type = "METRIC", 
##D                       comparisonValue = 1, 
##D                       scope = "USER")
##D                       
##D                       
##D se2 <- segment_element("medium", 
##D                        operator = "EXACT", 
##D                        type = "DIMENSION", 
##D                        expressions = "organic")
##D                        
##D                        
##D ## choose between segment_vector_simple or segment_vector_sequence
##D ## Elements can be combined into clauses, which can then be 
##D ##    combined into OR filter clauses
##D sv_simple <- segment_vector_simple(list(list(se)))
##D 
##D sv_simple2 <- segment_vector_simple(list(list(se2)))
##D 
##D ## Each segment vector can then be combined into a logical AND
##D 
##D seg_defined <- segment_define(list(sv_simple, sv_simple2))
##D 
##D ## if only one AND definition, you can leave out wrapper list()
##D 
##D seg_defined_one <- segment_define(sv_simple)
##D 
##D ## Each segement defintion can apply to users, sessions or both.
##D ## You can pass a list of several segments
##D 
##D segment4 <- segment_ga4("simple", user_segment = seg_defined)
##D ## Add the segments to the segments param
##D 
##D segment_example <- google_analytics(ga_id, 
##D                                     c("2015-07-30","2015-10-01"), 
##D                                     dimensions=c('source','medium','segment'), 
##D                                     segments = segment4, 
##D                                     metrics = c('sessions','bounces')
##D                                      )
##D                                      
##D                                      
##D ## Sequence segment
##D 
##D se2 <- segment_element("medium", 
##D                        operator = "EXACT", 
##D                        type = "DIMENSION", 
##D                        expressions = "organic")
##D                        
##D se3 <- segment_element("medium",
##D                        operator = "EXACT",
##D                        type = "DIMENSION",
##D                        not = TRUE,
##D                       expressions = "organic")
##D                       
##D ## step sequence
##D ## users who arrived via organic then via referral
##D sv_sequence <- segment_vector_sequence(list(list(se2), 
##D                                             list(se3)))
##D                                             
##D seq_defined2 <- segment_define(list(sv_sequence))
##D 
##D segment4_seq <- segment_ga4("sequence", user_segment = seq_defined2)
##D 
##D ## Add the segments to the segments param
##D 
##D segment_seq_example <- google_analytics(ga_id, 
##D                                         c("2016-04-01","2016-05-01"), 
##D                                         dimensions=c('source','segment'), 
##D                                         segments = segment4_seq,
##D                                         metrics = c('sessions','bounces')
##D                                          )
##D                                      
## End(Not run)




