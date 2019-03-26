library(raustats)


### Name: abs_cat_tables
### Title: Return ABS catalogue tables
### Aliases: abs_cat_tables

### ** Examples

  ## No test: 
    ## List latest available quarterly National Accounts tables
    ana_tables <- abs_cat_tables("5206.0", releases="Latest");
    ana_tables_url <- abs_cat_tables("5206.0", releases="Latest", include_urls=TRUE);
  
    ## List latest available CPI Time Series Spreadsheet tables only
    cpi_tables <- abs_cat_tables("6401.0", releases="Latest", types="tss");
    cpi_tables_url <- abs_cat_tables("5206.0", releases="Latest", types="tss", include_urls=TRUE);
  
    ## List latest available ASGS Volume 3 Data Cubes
    asgs_vol3_tables <- abs_cat_tables("1270.0.55.003", releases="Latest", types="css");
    asgs_vol3_tables_url <- abs_cat_tables("1270.0.55.003", releases="Latest",
                                           types="css", include_urls=TRUE);
  
    ## List latest available ASGS ANZSIC publications (PDF) files
    anzsic_2006 <- abs_cat_tables("1292.0", releases="Latest", types="pub", include_urls=TRUE);
  
## End(No test)



