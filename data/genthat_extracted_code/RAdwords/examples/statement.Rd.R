library(RAdwords)


### Name: statement
### Title: Build Adwords Query Language Statement
### Aliases: statement

### ** Examples

body <- statement(select=c('CampaignName','Clicks','Cost','Ctr'),
                  report="CAMPAIGN_PERFORMANCE_REPORT",
                  where="CampaignName STARTS_WITH 'A' AND Clicks > 100",
                  start="2018-01-20",
                  end="2018-01-21")
body <- statement(select=c('Criteria','Clicks','Cost','Ctr'),
                  report="KEYWORDS_PERFORMANCE_REPORT",
                  where="Clicks > 100",
                  start="2018-01-20",
                  end="2018-01-21")    
body <- statement(select=c('Clicks','AveragePosition','Cost','Ctr'),
                  report="ACCOUNT_PERFORMANCE_REPORT",
                  start="2018-01-20",
                  end="2018-01-21") 



