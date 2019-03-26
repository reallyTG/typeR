library(slickR)


### Name: slickR
### Title: slick.js image carousel htmlwidget
### Aliases: slickR

### ** Examples

## No test: 

nba=c("ATL","BKN","BOS","CHA","CHI","CLE","DAL","DEN","DET","GSW",
"HOU","IND","LAC","LAL","MEM","MIA","MIL","MIN","NOP","NYK",
"OKC","ORL","PHI","PHX","POR","SAC","SAS","TOR","UTA","WAS")

nba_logos=sprintf("https://i.cdn.turner.com/nba/nba/.element/img/4.0/
global/logos/512x512/bg.white/svg/%s.svg",nba)

if(interactive()) 
  slickR(obj=nba_logos)
  
## End(No test)




