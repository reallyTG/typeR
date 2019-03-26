## ---- echo=FALSE---------------------------------------------------------
knitr::opts_chunk$set(collapse=TRUE, comment="#>")

## ----message=FALSE, warning=FALSE----------------------------------------
library(raustats)

## ----eval=FALSE----------------------------------------------------------
#  cpi_all <- abs_cat_stats("6401.0")

## ----eval=FALSE----------------------------------------------------------
#  cpi <- abs_cat_stats("6401.0", tables="Table.+1\\D")

## ----eval=FALSE----------------------------------------------------------
#  cpi <- abs_cat_stats("6401.0", tables="CPI: All Groups, Index Numbers and Percentage Change")

## ----eval=FALSE----------------------------------------------------------
#  cpi_api <- abs_stats("CPI", filter=list(MEASURE=1, REGION=c(1:8,50),
#                                          INDEX=10001, TSEST=10, FREQUENCY="Q"))

## ----eval=FALSE----------------------------------------------------------
#  rba_bs <- rba_stats("A1")

## ----message=FALSE, results=FALSE----------------------------------------
ana_q <- abs_cat_stats(cat_no = "5206.0")

## ----echo=FALSE, results=TRUE--------------------------------------------
## Latest quarterly national accounts
head(ana_q)

## ----eval=FALSE, message=FALSE-------------------------------------------
#  ana_q <- abs_cat_stats(cat_no = "5206.0", tables=c("^Table 1\\.", "^Table 2\\."))

## ----eval=FALSE, echo=FALSE----------------------------------------------
#  ana_q <- abs_cat_stats(cat_no = "5206.0",
#                         tables=c(".*Key National Accounts Aggregates",
#                                  ".*Expenditure on Gross Domestic Product (GDP), Chain volume measures"))

## ----eval=FALSE----------------------------------------------------------
#  ana_2017Q4 <- abs_cat_stats(cat_no="5206.0", tables="Table 1", releases="Dec 2017");
#  ## or
#  ana_2017Q4 <- abs_cat_stats(cat_no="5206.0", tables="Table 1", releases=as.Date("2017-12-01"));

## ----eval=FALSE----------------------------------------------------------
#  ana_Q4 <- abs_cat_stats(cat_no="5206.0", tables="Table 1", releases=c("Dec 2017","Dec 2016"));

## ----eval=FALSE----------------------------------------------------------
#  lf_age <- abs_cat_tables("6291.0.55.001", include_urls=TRUE) %>%
#    filter(grepl("LM1.+", item_name)) %>%
#    .$path_1 %>%
#    abs_cat_download %>%
#    abs_cat_unzip %>%
#    read_excel(sheet="Data 1", skip=3)

## ----message=FALSE-------------------------------------------------------
ana_tables <- abs_cat_tables(cat_no="5206.0")

## ----echo=FALSE----------------------------------------------------------
head(ana_tables)

## ----message=FALSE-------------------------------------------------------
## CPI
cpi_tables <- abs_cat_tables(cat_no="6401.0")

## ----echo=FALSE----------------------------------------------------------
head(cpi_tables)

## ----message=FALSE-------------------------------------------------------
ana_tables <- abs_cat_tables(cat_no="5206.0", releases=c("Sep 2017", "Dec 2017"),
                             include_urls=TRUE)

## ----echo=FALSE----------------------------------------------------------
head(ana_tables)

## ----message=FALSE-------------------------------------------------------
asgs_files <- abs_cat_tables(cat_no="1270.0.55.001", types="css", include_urls=TRUE)

## ----echo=FALSE----------------------------------------------------------
head(asgs_files)

## ----message=FALSE, results=FALSE----------------------------------------
tables <- abs_cat_tables("5206.0", releases="Latest", include_urls=TRUE);
downloaded_tables <- abs_cat_download(tables$path_2[1], exdir=tempdir())
print(downloaded_tables)

## ------------------------------------------------------------------------
extracted_files <- abs_cat_unzip(downloaded_tables)
print(extracted_files)

## ----eval=FALSE----------------------------------------------------------
#  ana_q <- abs_read_tss(extracted_files);

## ----message=FALSE, results="asis"---------------------------------------
datasets <- abs_datasets()
head(datasets)

## ------------------------------------------------------------------------
abs_dimensions('CPI')

## ------------------------------------------------------------------------
str(abs_cachelist[["CPI"]])

## ------------------------------------------------------------------------
abs_search("CPI|consumer price index")

abs_search("CPI|consumer price index", code_only=TRUE)

## ------------------------------------------------------------------------
abs_search("labour force")

abs_search("^labour force$")

## ----eval=FALSE, echo=FALSE----------------------------------------------
#  abs_search("All groups", dataset="CPI")

## ----message=FALSE-------------------------------------------------------
abs_search(c("All groups CPI","Sydney"), dataset="CPI")

## ----echo=FALSE, eval=FALSE----------------------------------------------
#  abs_search("All groups CPI", dataset="CPI", code_only=TRUE)

## ----message=FALSE-------------------------------------------------------
abs_search(c("All groups CPI","Sydney"), dataset="CPI", code_only=TRUE)

## ----message=FALSE, results=FALSE----------------------------------------
cpi <- abs_stats(dataset="CPI", filter=list(MEASURE=1, REGION=c(1:8,50),
                                            INDEX=10001, TSEST=10, FREQUENCY="Q"))

## ----echo=FALSE----------------------------------------------------------
head(cpi)

## ----eval=FALSE----------------------------------------------------------
#  cpi <- abs_stats(dataset="CPI", filter="all")

## ----eval=FALSE----------------------------------------------------------
#  cpi <- abs_stats(dataset="CPI", filter="all", enforce_api_limits=FALSE)

## ----echo=TRUE-----------------------------------------------------------
abs_stats(dataset="CPI", filter=list(MEASURE=1, REGION=c(1:8,50),
                                     INDEX=10001, TSEST=10, FREQUENCY="Q"),
          return_url=TRUE)

## ----message=FALSE, results=FALSE----------------------------------------
filter_lst <- abs_search(c("Index numbers", "All groups",
                           "Sydney|Melbourne|Brisbane|Adelaide|Perth|Hobart|Darwin|Canberra|capital cities",
                           "Original", "Quarterly"),
                         dataset="CPI", code_only=TRUE)
cpi <- abs_stats("CPI", filter = filter_lst)

## ----message=FALSE, results=FALSE----------------------------------------
cpi <- abs_stats(dataset="CPI", filter=filter_lst,
                 start_date = "2015-Q3", end_date = "2018-Q2")

## ------------------------------------------------------------------------
rba_cache <- rba_table_cache()

## ----echo=FALSE----------------------------------------------------------
head(rba_cache)

## ------------------------------------------------------------------------
rba_search(pattern = "Liabilities and Assets")

## ----message=FALSE, results=FALSE----------------------------------------
rba_a1 <- rba_stats(table_no = "A1")

## ----echo=FALSE----------------------------------------------------------
head(rba_a1)

## ----eval=FALSE----------------------------------------------------------
#  rba_a1 <- rba_stats(pattern = "Liabilities and Assets.+Summary")

## ----message=FALSE, results=FALSE----------------------------------------
a1_tables <- rba_search(pattern = "Liabilities and Assets.+Summary")
rba_a1 <- rba_stats(url = a1_tables$url)

## ----echo=FALSE----------------------------------------------------------
head(rba_a1)

## ----message=FALSE, results=FALSE----------------------------------------
a1_tables <- rba_search(pattern = "Liabilities and Assets.+Summary")
downloaded_tables <- rba_file_download(a1_tables$url, exdir=tempdir())
print(downloaded_tables)

## ----eval=FALSE----------------------------------------------------------
#  a1_data <- rba_read_tss(downloaded_tables)

## ----echo=FALSE, eval=FALSE----------------------------------------------
#  head(a1_data)

## ----message=FALSE, results=FALSE----------------------------------------
capex_q <-
  abs_cat_stats("5625.0",
                tables=c("Actual Expenditure by Type of Asset and Industry - Current Prices",
                         "Actual Expenditure, By Type of Industry - Chain Volume Measures",
                         "Actual and Expected Capital Expenditure by Industry.+:Current Prices"))

## ----results=FALSE, message=FALSE----------------------------------------
library(dplyr)
## Add state/territory variable
capex_q <- capex_q %>%
  mutate(state = sub(sprintf(".*(%s).*",
                             paste(c("New South Wales","Victoria","Queensland","South Australia",
                                     "Western Australia","Tasmania","Northern Territory",
                                     "Australian Capital Territory","Total \\(State\\)"),
                                   collapse="|")),
                     "\\1", data_item_description, ignore.case=TRUE))

## ----fig.height=4, fig.width=7, fig.path="figures/", error=TRUE, message=TRUE, verbose=TRUE----
library(ggplot2)
## Filter mining capital expenditure
capex_q_min <- capex_q %>%
  filter(grepl("mining", data_item_description, ignore.case=TRUE)) %>%
  filter(grepl("actual", data_item_description, ignore.case=TRUE)) %>%
  filter(grepl("current price", data_item_description, ignore.case=TRUE)) %>%
  filter(grepl("Total \\(Type of Asset.+\\)", data_item_description, ignore.case=TRUE))

ggplot(data=capex_q_min) +
  geom_line(aes(x=date, y=value/10^3, colour=state)) +
  scale_x_date(date_labels="%b\n%Y") +
  scale_y_continuous(limits=c(0, NA)) +
  labs(title="Australian mining sector capital expenditure, by state",
       y="Capital expenditure ($ billion)", x=NULL) +
  guides(colour = guide_legend(title=NULL)) + 
  theme(plot.title = element_text(hjust=0.5),
        legend.box = "horizontal",
        legend.position = "bottom",
        axis.text.x=element_text(angle=0, size=8))

