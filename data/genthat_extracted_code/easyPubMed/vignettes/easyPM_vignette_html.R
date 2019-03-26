## ----include = FALSE-----------------------------------------------------
library(easyPubMed)
library(XML)

## ----message = FALSE, warning = FALSE------------------------------------
my_query <- "Damiano Fantini[AU]"
my_entrez_id <- get_pubmed_ids(my_query)
my_abstracts_txt <- fetch_pubmed_data(my_entrez_id, format = "abstract")
my_abstracts_txt[1:10]

## ----message = FALSE, warning = FALSE------------------------------------
my_abstracts_xml <- fetch_pubmed_data(my_entrez_id)
class(my_abstracts_xml) 
#
# apply "saveXML" to each //ArticleTitle tag via XML::xpathApply()
my_titles <- unlist(xpathApply(my_abstracts_xml, "//ArticleTitle", saveXML))
#
# use gsub to remove the tag, also trim long titles
my_titles <- gsub("(^.{5,10}Title>)|(<\\/.*$)", "", my_titles)
my_titles[nchar(my_titles)>75] <- paste(substr(my_titles[nchar(my_titles)>75], 1, 70), 
                                        "...", sep = "")
print(my_titles)

## ----message = FALSE, warning = FALSE, eval=TRUE-------------------------
new_query <- "(APE1[TI] OR OGG1[TI]) AND (2012[PDAT]:2016[PDAT])"
out.A <- batch_pubmed_download(pubmed_query_string = new_query, 
                               format = "xml", 
                               batch_size = 150,
                               dest_file_prefix = "easyPM_example")
out.A # this variable stores the name of the output files

## ----message = FALSE, warning = FALSE, eval=TRUE-------------------------
my_PM_list <- articles_to_list(my_abstracts_xml)
class(my_PM_list[[4]])
cat(substr(my_PM_list[[4]], 1, 984))

## ----message = FALSE, warning = FALSE, eval=TRUE-------------------------
curr_PM_record <- my_PM_list[[4]]
custom_grep(curr_PM_record, tag = "DateCompleted")
custom_grep(curr_PM_record, tag = "LastName", format = "char")

## ----message = FALSE, warning = FALSE, eval=TRUE-------------------------
my.df <- article_to_df(curr_PM_record, max_chars = 18)
#
# Fields extracted from the PubMed record
colnames(my.df)
#
# Trim long strings and then Display some content: each row corresponds to one author
my.df$title <- substr(my.df$title, 1, 15)
my.df$address <- substr(my.df$address, 1, 19)
my.df$jabbrv <- substr(my.df$jabbrv, 1, 10)
my.df[,c("pmid", "title", "jabbrv", "firstname", "address")]

## ----message = FALSE, warning = FALSE, eval=TRUE-------------------------
my.df2 <- article_to_df(curr_PM_record, autofill = TRUE)
my.df2$title <- substr(my.df2$title, 1, 15)
my.df2$jabbrv <- substr(my.df2$jabbrv, 1, 10)
my.df2$address <- substr(my.df2$address, 1, 19)
my.df2[,c("pmid", "title", "jabbrv", "firstname", "address")]

## ----message = FALSE, warning = FALSE, eval=TRUE-------------------------
new_PM_query <- "(APEX1[TI] OR OGG1[TI]) AND (2010[PDAT]:2013[PDAT])"
out.B <- batch_pubmed_download(pubmed_query_string = new_PM_query, dest_file_prefix = "apex1_sample")
# Retrieve the full name of the XML file downloaded in the previous step
new_PM_file <- out.B[1]
new_PM_df <- table_articles_byAuth(pubmed_data = new_PM_file, included_authors = "first", max_chars = 0)
# Alternatively, the output of a fetch_pubmed_data() could have been used
#
# Printing a sample of the resulting data frame
new_PM_df$address <- substr(new_PM_df$address, 1, 28)
new_PM_df$jabbrv <- substr(new_PM_df$jabbrv, 1, 9)
print(new_PM_df[1:10, c("pmid", "year", "jabbrv", "lastname", "address")])  

## ----message = FALSE, warning = FALSE, eval=TRUE-------------------------
sessionInfo()

## ----include = FALSE-----------------------------------------------------
# cleaning
for (xfile in c(out.A, out.B)) {
   tryCatch(file.remove(xfile), error = function(e){NULL})  
}

