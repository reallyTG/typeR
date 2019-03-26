## ---- eval=F, echo=FALSE-------------------------------------------------
#  if(!require(devtools)){install.packages("devtools", repos = "http://cran.us.r-project.org")}
#  if(!require(ggplot2)){install.packages("ggplot2", repos = "http://cran.us.r-project.org")}

## ----eval = FALSE--------------------------------------------------------
#  install.packages("congressbr")

## ----eval=FALSE----------------------------------------------------------
#  library(congressbr)

## ---- message = F, warning = F, echo=FALSE-------------------------------
library(congressbr)
library(ggplot2)

## ------------------------------------------------------------------------
sen_votes(date = "20160908")

## ------------------------------------------------------------------------
sen_plenary_result(date = "20160303")

## ------------------------------------------------------------------------
sen_senator_list()
sen_senator_details(id = "3398") # Cristovam Buarque
sen_senator_bills(id = "3398")

## ----message = FALSE, warning=FALSE--------------------------------------
sen_coalition_info(code = 200)

## ------------------------------------------------------------------------
data("commissions")
sen_commissions_senators(code = "CCJ")

## ------------------------------------------------------------------------
sen_parties()

## ------------------------------------------------------------------------
UF()

## ------------------------------------------------------------------------
sen_bills_passing(year = "2001", type = "MPV")

## ------------------------------------------------------------------------
sen_agenda(initial_date = "20161105", end_date = "20161125")

## ---- message=FALSE, warning=FALSE, echo = FALSE-------------------------
all_sens <- sen_senator_list()

## ---- message = F, warning = F, eval = F---------------------------------
#  library(ggplot2)
#  all_sens <- sen_senator_list()
#  
#  ggplot(all_sens, aes(x = gender)) +
#    geom_bar(aes(fill = gender), colour = "white") +
#    theme_classic() +
#    scale_fill_manual(values = c("#45C74A", "#FFFF00"))

## ---- echo=-1:-2, message = F, warning = F, eval = F---------------------
#  ggplot(all_sens, aes(x = status)) +
#    geom_bar(aes(fill = status), colour = "black") +
#    theme_classic() +
#    scale_fill_manual(values = c("#45C74A", "navy")) +
#    theme(legend.position = "none") +
#    coord_flip()

## ---- message = F, warning = F-------------------------------------------
if(!require(dplyr)){install.packages("dplyr", repos = "http://cran.us.r-project.org")}
library(dplyr)

all_sens %>% filter(status != "Titular") %>% group_by(state) %>% 
  summarise(totals = n()) %>% arrange(desc(totals))

