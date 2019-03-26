library(textTinyR)


### Name: text_file_parser
### Title: text file parser
### Aliases: text_file_parser

### ** Examples


library(textTinyR)

# In case that the 'input_path_file' is a valid path
#---------------------------------------------------
 
# fp = text_file_parser(input_path_file = '/folder/input_data.txt',

#                       output_path_file = '/folder/output_data.txt',

#                       start_query = 'word_a', end_query = 'word_w',

#                       min_lines = 1, trimmed_line = FALSE)
                     
                     
# In case that the 'input_path_file' is a character vector of strings
#--------------------------------------------------------------------

#  PATH_url = "https://FILE.xml"
  
#  con = url(PATH_url, method = "libcurl")
  
#  tmp_dat = read.delim(con, quote = "\"", comment.char = "", stringsAsFactors = FALSE)
  
#  vec_docs = unlist(lapply(1:length(as.vector(tmp_dat[, 1])), function(x) 

#                    trimws(tmp_dat[x, 1], which = "both")))
  
#  parse_data = text_file_parser(input_path_file = vec_docs,
  
#                                start_query = c("<query1>", "<query2>", "<query3>"),
  
#                                end_query = c("</query1>", "</query2>", "</query3>"), 
  
#                                min_lines = 1, trimmed_line = TRUE)



