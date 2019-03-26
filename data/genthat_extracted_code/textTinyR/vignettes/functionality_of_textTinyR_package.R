## ---- eval = T, echo = F-------------------------------------------------

 knitr::kable(data.frame(big_tokenize_transform = c('big_text_splitter()', 'big_text_parser()', 'big_text_tokenizer()', 'vocabulary_accumulator()', '',  '',  '',  '',  '',  ''), sparse_term_matrix = c('Term_Matrix()', 'Term_Matrix_Adjust()', 'term_associations()', 'most_frequent_terms()',  '',  '',  '',  '',  '',  ''), token_stats = c('path_2vector()', 'freq_distribution()',  'print_frequency()',  'count_character()',  'print_count_character()',  'collocation_words()',  'print_collocations()',  'string_dissimilarity_matrix()',  'look_up_table()',  'print_words_lookup_tbl()')))

## ---- eval = T, echo = F-------------------------------------------------

 knitr::kable(data.frame(sparse_matrices = c('dense_2sparse()', 'load_sparse_binary()', 'matrix_sparsity()',  'save_sparse_binary()',  'sparse_Means()',  'sparse_Sums()', '', '', ''), tokenization = c('tokenize_transform_text()',  'tokenize_transform_vec_docs()', '',  '',  '',  '', '',   '',  ''), utilities = c('bytes_converter()',  'cosine_distance()',  'dice_distance()',  'levenshtein_distance()',  'read_characters()',  'read_rows()', 'text_file_parser()',  'utf_locale()',  'vocabulary_parser()')))

## ---- eval = F, echo = T-------------------------------------------------
#  
#  
#  library(textTinyR)
#  
#  
#  PATH = 'enwiki-latest-pages-articles.xml'
#  
#  
#  subset = read_rows(input_file = PATH, read_delimiter = "\n",
#  
#                     rows = 100,
#  
#                     write_2file = "/subs_output.txt")
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  # data subset : subs_output.txt
#  
#  
#  <mediawiki xmlns="http://www.mediawiki.org/xml/export-0.10/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.mediawiki.org/xml/export-0.10/ http://www.mediawiki.org/xml/export-0.10.xsd" version="0.10" xml:lang="en">
#    <siteinfo>
#      <sitename>Wikipedia</sitename>
#      <dbname>enwiki</dbname>
#      <base>https://en.wikipedia.org/wiki/Main_Page</base>
#      <generator>MediaWiki 1.28.0-wmf.23</generator>
#      <case>first-letter</case>
#      <namespaces>
#        <namespace key="-2" case="first-letter">Media</namespace>
#        <namespace key="-1" case="first-letter">Special</namespace>
#        <namespace key="0" case="first-letter" />
#        <namespace key="1" case="first-letter">Talk</namespace>
#        <namespace key="2" case="first-letter">User</namespace>
#        <namespace key="3" case="first-letter">User talk</namespace>
#        <namespace key="4" case="first-letter">Wikipedia</namespace>
#        <namespace key="5" case="first-letter">Wikipedia talk</namespace>
#        <namespace key="6" case="first-letter">File</namespace>
#        <namespace key="7" case="first-letter">File talk</namespace>
#        <namespace key="8" case="first-letter">MediaWiki</namespace>
#  .
#  .
#  .
#      </namespaces>
#    </siteinfo>
#    <page>
#      <title>AccessibleComputing</title>
#      <ns>0</ns>
#      <id>10</id>
#      <redirect title="Computer accessibility" />
#      <revision>
#        <id>631144794</id>
#        <parentid>381202555</parentid>
#        <timestamp>2014-10-26T04:50:23Z</timestamp>
#        <contributor>
#          <username>Paine Ellsworth</username>
#          <id>9092818</id>
#        </contributor>
#        <comment>add [[WP:RCAT|rcat]]s</comment>
#        <model>wikitext</model>
#        <format>text/x-wiki</format>
#        <text xml:space="preserve">#REDIRECT [[Computer accessibility]]
#  
#  {{Redr|move|from CamelCase|up}}</text>
#        <sha1>4ro7vvppa5kmm0o1egfjztzcwd0vabw</sha1>
#      </revision>
#    </page>
#    <page>
#      <title>Anarchism</title>
#      <ns>0</ns>
#      <id>12</id>
#      <revision>
#        <id>746687538</id>
#        <parentid>744318951</parentid>
#        <timestamp>2016-10-28T22:43:19Z</timestamp>
#        <contributor>
#          <username>Eduen</username>
#          <id>7527773</id>
#        </contributor>
#        <minor />
#        <comment>/* Free love */</comment>
#        <model>wikitext</model>
#        <format>text/x-wiki</format>
#        <text xml:space="preserve">{{Redirect2|Anarchist|Anarchists|the fictional character|Anarchist (comics)|other uses|Anarchists (disambiguation)}}
#  {{pp-move-indef}}
#  .
#  .
#  .
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  
#  btt = big_tokenize_transform$new(verbose = TRUE)
#  
#  btt$big_text_splitter(input_path_file = PATH,             # path to the enwiki data file
#  
#                    output_path_folder = "/enwiki_spl_data/",  # folder to save the files
#  
#                    end_query = '</text>',    # splits the file taking into account the key-word
#  
#                    batches = 40,                           # split file in 40 batches (files)
#  
#                    trimmed_line = FALSE)                   # the lines will be trimmed

## ---- eval = F, echo = T-------------------------------------------------
#  
#  approx. 10 % of data pre-processed
#  approx. 20 % of data pre-processed
#  approx. 30 % of data pre-processed
#  approx. 40 % of data pre-processed
#  approx. 50 % of data pre-processed
#  approx. 60 % of data pre-processed
#  approx. 70 % of data pre-processed
#  approx. 80 % of data pre-processed
#  approx. 90 % of data pre-processed
#  approx. 100 % of data pre-processed
#  
#  It took 42.7098 minutes to complete the splitting
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  btt$big_text_parser(input_path_folder = "/enwiki_spl_data/", # the previously created folder
#  
#                      output_path_folder = "/enwiki_parse/",  # folder to save the parsed files
#  
#                      start_query = "<text xml:space=\"preserve\">",  # starts to extract text
#  
#                      end_query = "</text>",                        # stop to extract once here
#  
#                      min_lines = 1,
#  
#                      trimmed_line = TRUE)

## ---- eval = F, echo = T-------------------------------------------------
#  
#  ====================
#  batch 1 begins ...
#  ====================
#  
#  approx. 10 % of data pre-processed
#  approx. 20 % of data pre-processed
#  approx. 30 % of data pre-processed
#  approx. 40 % of data pre-processed
#  approx. 50 % of data pre-processed
#  approx. 60 % of data pre-processed
#  approx. 70 % of data pre-processed
#  approx. 80 % of data pre-processed
#  approx. 90 % of data pre-processed
#  approx. 100 % of data pre-processed
#  
#  It took 0.296151 minutes to complete the preprocessing
#  
#  It took 0.0525948 minutes to save the pre-processed data
#  
#  .
#  .
#  .
#  .
#  
#  ====================
#  batch 40 begins ...
#  ====================
#  
#  approx. 10 % of data pre-processed
#  approx. 20 % of data pre-processed
#  approx. 30 % of data pre-processed
#  approx. 40 % of data pre-processed
#  approx. 50 % of data pre-processed
#  approx. 60 % of data pre-processed
#  approx. 70 % of data pre-processed
#  approx. 80 % of data pre-processed
#  approx. 90 % of data pre-processed
#  approx. 100 % of data pre-processed
#  
#  It took 1.04127 minutes to complete the preprocessing
#  
#  It took 0.0448579 minutes to save the pre-processed data
#  
#  It took 40.9034 minutes to complete the parsing
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  btt$big_text_tokenizer(input_path_folder = "/enwiki_parse/",   # the previously parsed data
#  
#                         batches = 4,     # each single file will be split further in 4 batches
#  
#                         to_lower = TRUE, trim_token = TRUE,
#  
#                         split_string=TRUE, max_num_char = 100,
#  
#                         split_separator = " \r\n\t.,;:()?!//",
#  
#                         remove_punctuation_vector = TRUE,
#  
#                         remove_numbers = TRUE,
#  
#                         remove_stopwords = TRUE,
#  
#                         threads = 4,
#  
#                         save_2single_file = TRUE,      # save to a single file
#  
#                         vocabulary_path_folder = "/enwiki_vocab/",  # path to vocabulary folder
#  
#                         path_2folder="/enwiki_token/")   # folder to save the transformed data
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  
#  ====================================
#  transformation of file 1 starts ...
#  ====================================
#  
#  -------------------
#  batch 1 begins ...
#  -------------------
#  
#  input of the data starts ...
#  conversion to lower case starts ...
#  removal of numeric values starts ...
#  the string-trim starts ...
#  the split of the character string and simultaneously the removal of the punctuation in the vector starts ...
#  stop words of the english language will be used
#  the removal of stop-words starts ...
#  character strings with more than or equal to 1 and less than 100 characters will be kept ...
#  the vocabulary counts will be saved in: /enwiki_vocab/batch1.txt
#  the pre-processed data will be saved in a single file in: /enwiki_token/
#  
#  -------------------
#  batch 2 begins ...
#  -------------------
#  
#  input of the data starts ...
#  conversion to lower case starts ...
#  removal of numeric values starts ...
#  the string-trim starts ...
#  the split of the character string and simultaneously the removal of the punctuation in the vector starts ...
#  stop words of the english language will be used
#  the removal of stop-words starts ...
#  character strings with more than or equal to 1 and less than 100 characters will be kept ...
#  the vocabulary counts will be saved in: /enwiki_vocab/batch1.txt
#  the pre-processed data will be saved in a single file in: /enwiki_token/
#  
#  .
#  .
#  .
#  .
#  
#  ====================================
#  transformation of file 40 starts ...
#  ====================================
#  
#  -------------------
#  batch 1 begins ...
#  -------------------
#  
#  input of the data starts ...
#  conversion to lower case starts ...
#  removal of numeric values starts ...
#  the string-trim starts ...
#  the split of the character string and simultaneously the removal of the punctuation in the vector starts ...
#  stop words of the english language will be used
#  the removal of stop-words starts ...
#  character strings with more than or equal to 1 and less than 100 characters will be kept ...
#  the vocabulary counts will be saved in: /enwiki_vocab/batch40.txt
#  the pre-processed data will be saved in a single file in: /enwiki_token/
#  
#  -------------------
#  batch 2 begins ...
#  -------------------
#  
#  input of the data starts ...
#  conversion to lower case starts ...
#  removal of numeric values starts ...
#  the string-trim starts ...
#  the split of the character string and simultaneously the removal of the punctuation in the vector starts ...
#  stop words of the english language will be used
#  the removal of stop-words starts ...
#  character strings with more than or equal to 1 and less than 100 characters will be kept ...
#  the vocabulary counts will be saved in: /enwiki_vocab/batch40.txt
#  the pre-processed data will be saved in a single file in: /enwiki_token/
#  
#  .
#  .
#  .
#  .
#  
#  It took 111.689 minutes to complete tokenization
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  init$vocabulary_accumulator(input_path_folder = "/enwiki_vocab/",
#  
#                              vocabulary_path_file = "/VOCAB.txt",
#  
#                              max_num_chars = 50)

## ---- eval = F, echo = T-------------------------------------------------
#  
#  vocabulary.of.batch 40 will.be.merged ...	minutes.to.merge.sort.batches: 4.57273
#  
#  	minutes.to.save.data: 0.48584
#  

## ---- eval = T, echo = F-------------------------------------------------

 knitr::kable(data.frame(terms = c("lt", "refgt", "quot", "gt", "user", "category", 
"www", "http"), frequency = c(111408435L, 49197149L, 48688082L, 47466149L, 
32042007L, 30619748L, 25358252L, 23008243L)))


## ---- eval = F, echo = T-------------------------------------------------
#  
#  rdr_vocab = textTinyR::read_rows(input_file = "/VOCAB.txt", read_delimiter = "\n",
#  
#                                   rows = 200,
#  
#                                   write_2file = "/vocab_subset_200terms.txt")
#  
#  # read the reduced data
#  
#  vocab_sbs <- readr::read_delim("/vocab_subset_200terms.txt", "\t",
#  
#                                 escape_double = FALSE, col_names = FALSE,
#  
#                                 trim_ws = TRUE)
#  
#  # create the wordcloud
#  
#  pal2 <- RColorBrewer::brewer.pal(8, "Dark2")
#  
#  wordcloud::wordcloud(words = vocab_sbs$X1, freq = vocab_sbs$X2,
#  
#                       scale = c(4.5, 0.8), random.order = FALSE,
#  
#                       rot.per = .15, colors = pal2)
#  

## ---- fig.width = 5.0, fig.height = 5.0, eval = F, echo = F--------------
#  
#  # to reproduce the wordcloud (dependencies : readr, RColorBrewer, wordcloud)
#  
#  if (.Platform$OS.type == "windows") {
#  
#    seprt = "\\"
#  }
#  
#  if (.Platform$OS.type == "unix") {
#  
#    seprt = "/"
#  }
#  
#  
#  vocab_sbs <- suppressMessages(readr::read_delim(paste(getwd(), "vocab_subset_200terms.txt", sep = seprt), "\t", escape_double = FALSE, col_names = FALSE, trim_ws = TRUE))
#  
#  pal2 <- RColorBrewer::brewer.pal(8, "Dark2")
#  
#  wordcloud::wordcloud(words = vocab_sbs$X1, freq = vocab_sbs$X2, scale = c(4.5, 0.8), random.order = FALSE, rot.per = .15, colors = pal2)
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  library(fastTextR)
#  
#  skp = skipgram_cbow(input_path = "/output_token_single_file.txt", thread = 4, dim = 50,
#  
#                      output_path = "/model", method = "skipgram", verbose = 2)
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  Read 4018M words
#  Number of words:  12827221
#  Number of labels: 0
#  Progress: 0.2%  words/sec/thread: 89664  lr: 0.099841  loss: 1.055581  eta: 15h32m  14m
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  
#  reduced_data = read_characters(input_file = "/output_token_single_file.txt",
#  
#                                 characters = 1000000000,        # approx. 1 GB of the data
#  
#                                 write_2file = "/reduced_single_file.txt")
#  
#  
#  
#  
#  skp = skipgram_cbow(input_path = "/reduced_single_file.txt",  # reduced data set
#  
#                      output_path = "/model",                # saves model and word vectors
#  
#                      dim = 50,                              # 50-dimensional word vectors
#  
#                      method = "skipgram",                   # method = 'skipgram'
#  
#                      thread = 4, verbose = 2)

## ---- eval = F, echo = T-------------------------------------------------
#  
#  Read 124M words
#  Number of words:  5029370
#  Number of labels: 0
#  Progress: 100.0%  words/sec/thread: 94027  lr: 0.000000  loss: 0.186674  eta: 0h0m
#  
#  time to complete : 33.53577 mins
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  
#  lt 0.12207 0.16117 0.4641 0.73876 0.43968 0.63911 -0.53747 0.1398 .....
#  refgt -0.0038898 -0.13976 0.26077 0.7775 0.2228 0.28169 -0.48306 .....
#  quot 0.7295 -0.12472 0.32131 0.46965 0.45363 0.85022 -0.051471 .....
#  gt 0.41287 0.26584 0.6612 0.78185 0.46692 0.74092 -0.23816 .....
#  cite 0.037943 0.095684 0.62832 0.93794 0.19776 0.44592 -0.21641 .....
#  www -0.31855 0.42268 0.3875 1.5457 -0.23804 0.34022 -0.051849 .....
#  ref 0.45236 -0.21766 0.6341 0.76392 0.53734 0.66976 -0.23162 .....
#  http -0.42692 0.48637 0.28622 1.7019 -0.25739 0.25948 -0.026582 .....
#  namequot 0.56828 -0.30782 0.45707 0.78346 0.53727 0.62445 .....
#  – -0.010281 0.25528 0.04708 0.49679 0.043934 0.33733 -0.42706 .....
#  amp 0.06308 0.11968 0.11885 0.67699 -0.11448 0.25183 -0.48789 .....
#  category -1.5705 -0.40638 0.61064 2.5691 -0.52987 0.68096 .....
#  county -0.85743 0.071625 -0.43393 0.17157 -0.32874 1.771 .....
#  org -0.26974 0.76983 0.57599 1.5939 -0.1706 0.21937 -0.44645 .....
#  states -0.40973 -0.48528 0.092905 0.011603 -0.035727 0.52807 .....
#  united -0.25079 -0.49813 0.070942 0.16762 0.069961 0.56868 .....
#  web -0.066578 0.14837 0.23088 1.2919 -0.252 0.31441 -0.3799 .....
#  census -0.29033 -0.73695 0.35474 -0.5237 -0.15206 1.7089 .....
#  .
#  .
#  .

## ---- eval = F, echo = T-------------------------------------------------
#  
#  The term planet is ancient, with ties to history, astrology, science, mythology, and religion. Several planets in the Solar System can be seen with the naked eye. These were regarded by many early cultures as divine, or as emissaries of deities. As scientific knowledge advanced, human perception of the planets changed, incorporating a number of disparate objects. In 2006, the International Astronomical Union (IAU) officially adopted a resolution defining planets within the Solar System. This definition is controversial because it excludes many objects of planetary mass based on where or what they orbit.
#  Although eight of the planetary bodies discovered before 1950 remain planets under the modern definition, some celestial bodies, such as Ceres, Pallas, Juno and Vesta (each an object in the solar asteroid belt), and Pluto (the first trans-Neptunian object discovered), that were once considered planets by the scientific community, are no longer viewed as such.
#  The planets were thought by Ptolemy to orbit Earth in deferent and epicycle motions. Although the idea that the planets orbited the Sun had been suggested many times, it was not until the 17th century that this view was supported by evidence from the first telescopic astronomical observations, performed by Galileo Galilei.
#  At about the same time, by careful analysis of pre-telescopic observation data collected by Tycho Brahe, Johannes Kepler found the planets orbits were not circular but elliptical. As observational tools improved, astronomers saw that, like Earth, the planets rotated around tilted axes, and some shared such features as ice caps and seasons. Since the dawn of the Space Age, close observation by space probes has found that Earth and the other planets share characteristics such as volcanism, hurricanes, tectonics, and even hydrology.
#  Planets are generally divided into two main types: large low-density giant planets, and smaller rocky terrestrials. Under IAU definitions, there are eight planets in the Solar System. In order of increasing distance from the Sun, they are the four terrestrials, Mercury, Venus, Earth, and Mars, then the four giant planets, Jupiter, Saturn, Uranus, and Neptune. Six of the planets are orbited by one or more natural satellites.
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  init = sparse_term_matrix$new(vector_data = NULL,          # in case of vector of documents
#  
#                                file_data = "/planets.txt",     # input the .txt data
#  
#                                document_term_matrix = TRUE)   # document term matrix as output
#  
#  
#  
#  tm = init$Term_Matrix(sort_terms = TRUE,      # initial terms are sorted
#  
#                        to_lower = TRUE,          # convert to lower case
#  
#                        trim_token = TRUE,        # trim token
#  
#                        split_string = TRUE,      # split string
#  
#                        tf_idf = TRUE,            # tf-idf will be returned
#  
#                        verbose = TRUE)
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  minutes.to.tokenize.transform.data: 0.00001	total.time: 0.00001
#  
#  Warning message:
#  empty character strings present in the column names they will be replaced with proper characters
#  
#  5 x 212 sparse Matrix of class "dgCMatrix"
#     [[ suppressing 91 column names ‘X’, ‘X17th’, ‘X1950’ ... ]]
#  
#  [1,] -0.001939591 .         .          0.009747774 0.01949555   ......
#  [2,] -0.003255742 .         0.01636233 .           .            ......
#  [3,] -0.003440029 0.0172885 .          .           .            ......
#  [4,] -0.002196645 .         .          .           .            ......
#  [5,] -0.002681199 .         .          .           .          . ......
#  
#  [1,] 0.007121603 .          0.009747774 .          0.005434315 . ......
#  [2,] 0.007969413 0.01636233 .           .          .           . ......
#  [3,] .           .          .           .          0.009638219 . ......
#  [4,] 0.008065430 .          .           0.01103965 .             ......
#  [5,] .           .          .           .          .             ......
#  
#  [1,] -0.001939591 0.009747774 .          .          .           ......
#  [2,] -0.003255742 .           .          .          0.01636233  ......
#  [3,] -0.010320088 .           .          .          .           ......
#  [4,] -0.006589936 .           0.01103965 0.01103965 .           ......
#  [5,] -0.002681199 .           .          .          .           ......
#  .
#  .
#  .
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  res_adj = init$Term_Matrix_Adjust(sparsity_thresh = 0.6)
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  res_adj
#  
#  
#  5 x 9 sparse Matrix of class "dgCMatrix"
#            planets           by            X       solar          and          as  ......
#  [1,] -0.005818773 -0.001939591 -0.001939591 0.004747735 -0.001939591 0.007121603  ......
#  [2,] -0.006511484 -0.003255742 -0.003255742 0.003984706 -0.006511484 0.007969413  ......
#  [3,] -0.006880059 -0.010320088 -0.003440029 .           -0.003440029 .            ......
#  [4,] -0.006589936 -0.006589936 -0.002196645 .           -0.008786581 0.008065430  ......
#  [5,] -0.013405997 -0.002681199 -0.002681199 0.003281523 -0.008043598 .            ......
#  
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  dim(res_adj)
#  
#  [1] 5 9
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  init$term_associations(Terms = c('planets', 'by', 'INVALID'), keep_terms = NULL, verbose = TRUE)
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  the ' INVALID ' term does not exist in the terms vector
#  
#  total.number.variables.processed:   2	minutes.to.complete: 0.00000
#  
#  $planets
#       term correlation
#   1:    as  0.65943196
#   2:   and  0.48252671
#   3:     X  0.07521813
#   4:    by -0.26301349
#   5:    of         NaN
#   6: solar -0.11887462
#   7:  were         NaN
#   8:   the -0.15500900
#   9:   in.         NaN
#  10:  that  0.44307617
#  11: earth -0.24226093
#  
#  $by
#         term correlation
#   1:   solar   0.9092777
#   2:       X   0.5010034
#   3: planets  -0.2630135
#   4:      of         NaN
#   5:    were         NaN
#   6:     the   0.7838436
#   7:      as   0.3698239
#   8:     and  -0.0594149
#   9:     in.         NaN
#  10:   earth  -0.6952757
#  11:    that  -0.9338884
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  init = sparse_term_matrix$new(file_data = PATH, document_term_matrix = TRUE)
#  
#  tm = init$Term_Matrix(sort_terms = TRUE,
#  
#                        to_lower = TRUE,
#  
#                        trim_token = TRUE,
#  
#                        split_string = TRUE,
#  
#                        tf_idf = FALSE,            # disable tf-idf
#  
#                        verbose = TRUE)
#  
#  
#  init$most_frequent_terms(keep_terms = 10, threads = 1, verbose = TRUE)
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  minutes.to.complete: 0.00000
#  
#  
#          term frequency
#   1:     the        28
#   2: planets        15
#   3:     and        11
#   4:      of         9
#   5:      by         9
#   6:      as         8
#   7:     in.         6
#   8:       X         5
#   9:     are         5
#  10:    that         5
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  init = token_stats$new(path_2file = "/planets.txt")    # input the 'planets.txt' file
#  
#  vec = init$path_2vector()
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  [1] "The term planet is ancient, with ties to history, astrology, science, mythology, and religion. Several planets in the Solar System can be seen with the naked eye. These were regarded by many early cultures as divine, or as emissaries of deities. As scientific knowledge advanced, human perception of the planets changed, incorporating a number of disparate objects" ....
#  
#  [2] "Although eight of the planetary bodies discovered before 1950 remain" ....
#  .
#  .
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  # assuming the following 'freq_vocab.txt'
#  
#  the
#  term
#  planet
#  is
#  ancient
#  with
#  ties
#  to
#  history
#  astrology
#  science
#  mythology
#  and
#  religion
#  several
#  planets
#  in
#  the
#  solar
#  system
#  can
#  be
#  seen
#  with
#  the
#  naked
#  eye
#  these
#  were
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  init = token_stats$new(path_2file = 'freq_vocab.txt')
#  
#  init$freq_distribution()
#  
#  init$print_frequency(subset = NULL)
#  

## ---- eval = F, echo = T-------------------------------------------------
#          words freq
#   1:       the    3
#   2:      with    2
#   3:   ancient    1
#   4:       and    1
#   5: astrology    1
#   6:        be    1
#   7:       can    1
#   8:       eye    1
#   9:   history    1
#  10:        in    1
#  11:        is    1
#  12: mythology    1
#  13:     naked    1
#  14:    planet    1
#  15:   planets    1
#  16:  religion    1
#  17:   science    1
#  18:      seen    1
#  19:   several    1
#  20:     solar    1
#  21:    system    1
#  22:      term    1
#  23:     these    1
#  24:      ties    1
#  25:        to    1
#  26:      were    1
#          words freq
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#    init = token_stats$new(path_2file = 'freq_vocab.txt')
#  
#    vec_tmp = init$count_character()
#  
#    init$print_count_character(number = 3)
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  # words with number of characters equal to 3
#  
#  [1] "the" "and" "the" "can" "the" "eye"
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  # the data needs to be n-grams thus first tokenize and build the n-grams using
#  # the 'tokenize_transform_text' function ( the "planets.txt" file as input )
#  
#  tok = tokenize_transform_text("planets.txt",
#  
#                                to_lower = T,
#  
#                                split_string = T,
#  
#                                min_n_gram = 3,
#  
#                                max_n_gram = 3,
#  
#                                n_gram_delimiter = "_")
#  
#  init = token_stats$new(x_vec = tok$token)      # vector data as input
#  
#  vec_tmp = init$collocation_words()
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  [1] ""       "17th"       "1950"    "2006"    "a"     "about"   "adopted"   "advanced"
#  [9] "age"    "although" ....
#  .
#  .
#  .
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  res = init$print_collocations(word = "ancient")
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#      is   with   ties planet
#   0.333  0.333  0.167  0.167
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  # first initialization of token_stats
#  
#  init = token_stats$new(path_2file = 'freq_vocab.txt')
#  
#  tmp_vec = init$path_2vector()      # convert to vector
#  
#  
#  # second initialization to compute the dissimilarity matrix
#  
#  init_tok = token_stats$new(x_vec = tmp_vec)
#  
#  res = init_tok$string_dissimilarity_matrix(dice_n_gram = 2, method = "dice",
#  
#                                            split_separator = " ", dice_thresh = 1.0,
#  
#                                            upper = TRUE, diagonal = TRUE, threads = 1)
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#                  the      term     planet is   ancient      with      ties to   history  ....
#  the       0.0000000 0.6000000 1.00000000  1 1.0000000 1.0000000 0.6000000  1 1.0000000  ....
#  term      0.6000000 0.0000000 1.00000000  1 1.0000000 1.0000000 0.6666667  1 1.0000000  ....
#  planet    1.0000000 1.0000000 0.00000000  1 0.8181818 1.0000000 1.0000000  1 1.0000000  ....
#  is        1.0000000 1.0000000 1.00000000  0 1.0000000 1.0000000 1.0000000  0 1.0000000  ....
#  ancient   1.0000000 1.0000000 0.81818182  1 0.0000000 1.0000000 0.7777778  1 1.0000000  ....
#  with      1.0000000 1.0000000 1.00000000  1 1.0000000 0.0000000 1.0000000  1 1.0000000  ....
#  ties      0.6000000 0.6666667 1.00000000  1 0.7777778 1.0000000 0.0000000  1 1.0000000  ....
#  to        1.0000000 1.0000000 1.00000000  0 1.0000000 1.0000000 1.0000000  0 1.0000000  ....
#  history   1.0000000 1.0000000 1.00000000  1 1.0000000 1.0000000 1.0000000  1 0.0000000  ....
#  astrology 1.0000000 1.0000000 1.00000000  1 0.8571429 1.0000000 1.0000000  1 0.8571429  ....
#  science   1.0000000 1.0000000 1.00000000  1 0.3333333 1.0000000 0.7777778  1 1.0000000  ....
#  .
#  .
#  .

## ---- eval = F, echo = T-------------------------------------------------
#  
#                  the term     planet is   ancient with ties to history astrology   science ....
#  the       0.0000000    1 1.00000000  1 1.0000000    1    1  1       1         1 1.0000000 ....
#  term      1.0000000    0 1.00000000  1 1.0000000    1    1  1       1         1 1.0000000 ....
#  planet    1.0000000    1 0.00000000  1 1.0000000    1    1  1       1         1 1.0000000 ....
#  is        1.0000000    1 1.00000000  0 1.0000000    1    1  0       1         1 1.0000000 ....
#  ancient   1.0000000    1 1.00000000  1 0.0000000    1    1  1       1         1 0.3333333 ....
#  with      1.0000000    1 1.00000000  1 1.0000000    0    1  1       1         1 1.0000000 ....
#  ties      1.0000000    1 1.00000000  1 1.0000000    1    0  1       1         1 1.0000000 ....
#  to        1.0000000    1 1.00000000  0 1.0000000    1    1  0       1         1 1.0000000 ....
#  history   1.0000000    1 1.00000000  1 1.0000000    1    1  1       0         1 1.0000000 ....
#  astrology 1.0000000    1 1.00000000  1 1.0000000    1    1  1       1         0 1.0000000 ....
#  science   1.0000000    1 1.00000000  1 0.3333333    1    1  1       1         1 0.0000000 ....
#  .
#  .
#  .

## ---- eval = F, echo = T-------------------------------------------------
#  
#  # first initialization of token_stats
#  
#  init = token_stats$new(path_2file = 'freq_vocab.txt')
#  
#  tmp_vec = init$path_2vector()    # convert to vector
#  
#  
#  # second initialization to compute the look-up-table
#  
#  init_lk = token_stats$new(x_vec = tmp_vec)
#  
#  is_vec = init_lk$look_up_table(n_grams = 3)
#  
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  # example output for the 'is_vec' vector
#  
#  [1] ""    "ake" "_an" "anc" "ane" "_as" "ast" "cie" "eli" "enc" "era" "eve" .....
#  [29] "net" "ola" "olo" "_pl" "pla" "_re" "rel" "rol" "_sc" "sci" "_se" "see" .....
#  [57] "tro" "ver" "_we" "wer" "_wi" "wit" "yst" "yth"
#  
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  init_lk$print_words_lookup_tbl(n_gram = "log")
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  "_astrology_" "_mythology_"
#  

## ---- eval = T, echo = T-------------------------------------------------

#---------------------------------
# conversion from dense to sparse
#---------------------------------

library(textTinyR)

set.seed(1)
dsm = matrix(sample(0:1, 100, replace = T), 10, 10)

res_sp = dense_2sparse(dsm)

res_sp


## ---- eval = T, echo = T-------------------------------------------------

#---------------------
# row- or column- sums
#---------------------

sm_cols = sparse_Sums(res_sp, rowSums = FALSE)       # column-sums

sm_cols


sm_rows = sparse_Sums(res_sp, rowSums = TRUE)        # row-sums

sm_rows


## ---- eval = T, echo = T-------------------------------------------------

#----------------------
# row- or column- means
#----------------------

mn_cols = sparse_Means(res_sp, rowMeans = FALSE)    # column-means

mn_cols


mn_rows = sparse_Means(res_sp, rowMeans = TRUE)    # row-means

mn_rows



## ---- eval = T, echo = T-------------------------------------------------

#-------------------------------------
# sparsity of a matrix (as percentage)
#-------------------------------------

matrix_sparsity(res_sp)



## ---- eval = F, echo = T-------------------------------------------------
#  
#  #------------------------------------------------------
#  # saving and loading sparse matrices (in binary format)
#  #------------------------------------------------------
#  
#  save_sp = save_sparse_binary(res_sp, file_name = "save_sparse.mat")
#  
#  load_sp = load_sparse_binary(file_name = "save_sparse.mat")
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  
#  #------------------------
#  # tokenize_transform_text
#  #------------------------
#  
#  
#  # example input : "planets.txt"
#  
#  
#  res_txt = tokenize_transform_text(object = "/planets.txt",
#  
#                                    to_lower = TRUE,
#  
#                                    utf_locale = "",
#  
#                                    trim_token = TRUE,
#  
#                                    split_string = TRUE,
#  
#                                    remove_stopwords = TRUE,
#  
#                                    language = "english",
#  
#                                    stemmer = "ngram_sequential",
#  
#                                    stemmer_ngram = 3,
#  
#                                    threads = 1)
#  
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  # example output :
#  
#  $token
#    [1] "ter"          "planet"        "anci"         "ties"         "hist"  ...
#  
#    [16] "early"        "cultu"        "divi"         "emissar"      "deit" ....
#  
#    [31] "object"       "2006"         "internatio"   "astro"        "union" ...
#  
#    [46] "exclu"        "object"       "planet"        "mass"         "based"" ....
#  .
#  .
#  .
#  
#  attr(,"class")
#  [1] "tokenization and transformation"
#  
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  #----------------------------
#  # tokenize_transform_vec_docs
#  #----------------------------
#  
#  
#  # the input should be a vector of documents
#  
#  init = token_stats$new(path_2file = "/planets.txt")
#  
#  inp = init$path_2vector()   # convert text file to character vector
#  
#  
#  # run the function using the input-vector
#  
#  res_dct = tokenize_transform_vec_docs(object = inp,
#  
#                                        as_token = FALSE,  # return character vector of documents
#  
#                                        to_lower = TRUE,
#  
#                                        utf_locale = "",
#  
#                                        trim_token = TRUE,
#  
#                                        split_string = TRUE,
#  
#                                        remove_stopwords = TRUE,
#  
#                                        language = "english",
#  
#                                        stemmer = "porter2_stemmer",
#  
#                                        threads = 1)
#  
#  
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  $token
#  [1] "term planet ancient tie histori astrolog scienc mytholog religion planet solar ....."
#  
#  [2] "planetari bodi discov 1950 remain planet modern definit celesti bodi cere palla ....."
#  
#  [3] "planet thought ptolemi orbit earth defer epicycl motion idea planet orbit sun ....."
#  
#  [4] "time care analysi pre-telescop observ data collect tycho brahe johann kepler  ....."
#  
#  [5] "planet general divid main type larg lowdens giant planet smaller rocki terrestri ....."
#  
#  
#  attr(,"class")
#  [1] "tokenization and transformation"
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  
#  # run the function using the input-vector
#  
#  res_dct_tok = tokenize_transform_vec_docs(object = inp,
#  
#                                            as_token = TRUE,
#  
#                                            to_lower = TRUE,
#  
#                                            utf_locale = "",
#  
#                                            trim_token = TRUE,
#  
#                                            split_string = TRUE,
#  
#                                            remove_stopwords = TRUE,
#  
#                                            language = "english",
#  
#                                            stemmer = "porter2_stemmer",
#  
#                                            threads = 1)
#  
#  
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  $token
#  $token[[1]]
#   [1] "term"        "planet"    "ancient"  "tie"   "histori"   .....
#  
#  $token[[2]]
#   [1] "planetari"    "bodi"     "discov"   "1950"   "remain"   .....
#  
#  $token[[3]]
#   [1] "planet"       "thought"  "ptolemi"  "orbit"   "earth"   .....
#  
#  
#  attr(,"class")
#  [1] "tokenization and transformation"

## ---- eval = T, echo = T-------------------------------------------------

#---------------------------------------
# cosine distance between word sentences
#---------------------------------------

s1 = 'sentence with two words'

s2 = 'sentence with three words'

sep = " "

cosine_distance(s1, s2, split_separator = sep)


## ---- eval = T, echo = T-------------------------------------------------

#------------------------------------------------------------------------
# dice distance between two words (using n-grams -- the lower the better)
#------------------------------------------------------------------------

w1 = 'word_one'

w2 = 'word_two'

n = 2

dice_distance(w1, w2, n_grams = n)



## ---- eval = T, echo = T-------------------------------------------------

#---------------------------------------
# levenshtein distance between two words
#---------------------------------------

w1 = 'word_two'

w2 = 'word_one'

levenshtein_distance(w1, w2)


## ---- eval = F, echo = T-------------------------------------------------
#  
#  #---------------------------------------------
#  # bytes converter (returns the size of a file)
#  #---------------------------------------------
#  
#  PATH = "/planets.txt"
#  
#  bytes_converter(input_path_file = PATH, unit = "KB" )
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  ## [1] 2.213867
#  

## ---- eval = T, echo = T-------------------------------------------------

#---------------------------------------------------
# returns the utf-locale for the available languages
#---------------------------------------------------


utf_locale(language = "english")


## ---- eval = F, echo = T-------------------------------------------------
#  
#  #-----------------
#  # text file parser
#  #-----------------
#  
#  # The text file should have a structure (such as an xml-structure), so that
#  # subsets can be extracted using the "start_query" and "end_query" parameters.
#  # (it works similarly to the big_text_parser() method, however for small to medium sized files)
#  
#  # example input "example_file.xml" file :
#  
#  <?xml version="1.0"?>
#  <sked>
#    <version>2</version>
#    <flight>
#      <carrier>BA</carrier>
#      <number>4001</number>
#      <date>2011-07-21</date>
#    </flight>
#    <flight cancelled="true">
#      <carrier>BA</carrier>
#      <number>4002</number>
#      <date>2011-07-21</date>
#    </flight>
#  </sked>
#  
#  
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  fp = text_file_parser(input_path_file = "example_file.xml",
#  
#                        output_path_file = "/output_folder/example_output_file.txt",
#  
#                        start_query = '<number>', end_query = '</number>',
#  
#                        min_lines = 1, trimmed_line = FALSE)
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  "example_output_file.txt" :
#  
#  4001
#  4002
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  #------------------
#  # vocabulary parser
#  #------------------
#  
#  # the 'vocabulary_parser' function extracts a vocabulary from a structured text (such as
#  # an .xml file) and works in the exact same way as the 'big_tokenize_transform' class,
#  # however for small to medium sized data files
#  
#  
#  pars_dat = vocabulary_parser(input_path_file = '/folder/input_data.txt',
#  
#                               start_query = 'start_word', end_query = 'end_word',
#  
#                               vocabulary_path_file = '/folder/vocab.txt',
#  
#                               to_lower = TRUE, split_string = TRUE,
#  
#                               remove_stopwords = TRUE)
#  
#  

