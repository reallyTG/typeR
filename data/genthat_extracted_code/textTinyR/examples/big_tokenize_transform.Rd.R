library(textTinyR)


### Name: big_tokenize_transform
### Title: String tokenization and transformation for big data sets
### Aliases: big_tokenize_transform
### Keywords: datasets

### ** Examples


library(textTinyR)


# fs <- big_tokenize_transform$new(verbose = FALSE)

#---------------
# file splitter:
#---------------

# fs$big_text_splitter(input_path_file = "input.txt",

#                      output_path_folder = "/folder/output/",

#                      end_query = "endword", batches = 5,

#                      trimmed_line = FALSE)


#-------------
# file parser:
#-------------

# fs$big_text_parser(input_path_folder = "/folder/output/",

#                    output_path_folder = "/folder/parser/",

#                    start_query = "startword", end_query = "endword",

#                    min_lines = 1, trimmed_line = TRUE)


#----------------
# file tokenizer:
#----------------


# fs$big_text_tokenizer(input_path_folder = "/folder/parser/",

#                       batches = 5, split_string=TRUE,

#                       to_lower = TRUE, trim_token = TRUE,

#                       max_num_char = 100, remove_stopwords = TRUE,

#                       stemmer = "porter2_stemmer", threads = 1,

#                       path_2folder="/folder/output_token/",

#                       vocabulary_path_folder="/folder/VOCAB/")

#-------------------
# vocabulary counts:
#-------------------


# fs$vocabulary_accumulator(input_path_folder = "/folder/VOCAB/",

#                           vocabulary_path_file = "/folder/vocab.txt",

#                           max_num_chars = 50)



