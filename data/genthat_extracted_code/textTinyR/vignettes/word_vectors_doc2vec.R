## ---- eval = F, echo = T-------------------------------------------------
#  
#  NLTK = reticulate::import("nltk.corpus")
#  
#  text_reuters = NLTK$reuters
#  
#  
#  nltk = reticulate::import("nltk")
#  
#  # if the 'reuters' data is not already available then it can be downloaded from within R
#  
#  nltk$download('reuters')

## ---- eval = F, echo = T-------------------------------------------------
#  
#  documents = text_reuters$fileids()
#  
#  str(documents)
#  
#  
#  # List of categories
#  categories = text_reuters$categories()
#  
#  str(categories)
#  
#  
#  # Documents in a category
#  category_docs = text_reuters$fileids("acq")
#  
#  str(category_docs)
#  
#  
#  one_doc = text_reuters$raw("test/14843")
#  
#  one_doc
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  documents = text_reuters$fileids()
#  
#  
#  # document ids for train - test
#  train_docs_id = documents[as.vector(sapply(documents, function(i) substr(i, 1, 5) == "train"))]
#  test_docs_id = documents[as.vector(sapply(documents, function(i) substr(i, 1, 4) == "test"))]
#  
#  
#  train_docs = lapply(1:length(train_docs_id), function(x) text_reuters$raw(train_docs_id[x]))
#  test_docs = lapply(1:length(test_docs_id), function(x) text_reuters$raw(test_docs_id[x]))
#  
#  str(train_docs)
#  str(test_docs)
#  
#  
#  # train - test labels  [ some categories might have more than one label (overlapping) ]
#  
#  train_labels = as.vector(sapply(train_docs_id, function(x) text_reuters$categories(x)))
#  test_labels = as.vector(sapply(test_docs_id, function(x) text_reuters$categories(x)))

## ---- eval = F, echo = T-------------------------------------------------
#  concat = c(unlist(train_docs), unlist(test_docs))
#  
#  length(concat)
#  
#  
#  clust_vec = textTinyR::tokenize_transform_vec_docs(object = concat, as_token = T,
#                                                     to_lower = T,
#                                                     remove_punctuation_vector = F,
#                                                     remove_numbers = F,
#                                                     trim_token = T,
#                                                     split_string = T,
#                                                     split_separator = " \r\n\t.,;:()?!//",
#                                                     remove_stopwords = T,
#                                                     language = "english",
#                                                     min_num_char = 3,
#                                                     max_num_char = 100,
#                                                     stemmer = "porter2_stemmer",
#                                                     threads = 4,
#                                                     verbose = T)
#  
#  unq = unique(unlist(clust_vec$token, recursive = F))
#  length(unq)
#  
#  
#  # I'll build also the term matrix as I'll need the global-term-weights
#  
#  utl = textTinyR::sparse_term_matrix$new(vector_data = concat, file_data = NULL,
#                                          document_term_matrix = TRUE)
#  
#  tm = utl$Term_Matrix(sort_terms = FALSE, to_lower = T, remove_punctuation_vector = F,
#                       remove_numbers = F, trim_token = T, split_string = T,
#                       stemmer = "porter2_stemmer",
#                       split_separator = " \r\n\t.,;:()?!//", remove_stopwords = T,
#                       language = "english", min_num_char = 3, max_num_char = 100,
#                       print_every_rows = 100000, normalize = NULL, tf_idf = F,
#                       threads = 6, verbose = T)
#  
#  gl_term_w = utl$global_term_weights()
#  
#  str(gl_term_w)

## ---- eval = F, echo = T-------------------------------------------------
#  
#   save_dat = textTinyR::tokenize_transform_vec_docs(object = concat, as_token = T,
#                                                     to_lower = T,
#                                                     remove_punctuation_vector = F,
#                                                     remove_numbers = F, trim_token = T,
#                                                     split_string = T,
#                                                     split_separator = " \r\n\t.,;:()?!//",
#                                                     remove_stopwords = T, language = "english",
#                                                     min_num_char = 3, max_num_char = 100,
#                                                     stemmer = "porter2_stemmer",
#                                                     path_2folder = "/path_to_your_folder/",
#                                                     threads = 4, verbose = T)

## ---- eval = F, echo = T-------------------------------------------------
#  
#  PATH_INPUT = "/path_to_your_folder/output_token_single_file.txt"
#  
#  PATH_OUT = "/path_to_your_folder/rt_fst_model"
#  
#  
#  vecs = fastTextR::skipgram_cbow(input_path = PATH_INPUT, output_path = PATH_OUT,
#                                  method = "skipgram", lr = 0.075, lrUpdateRate = 100,
#                                  dim = 300, ws = 5, epoch = 5, minCount = 1, neg = 5,
#                                  wordNgrams = 2, loss = "ns", bucket = 2e+06,
#                                  minn = 0, maxn = 0, thread = 6, t = 1e-04, verbose = 2)
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  init = textTinyR::Doc2Vec$new(token_list = clust_vec$token,
#  
#                                word_vector_FILE = "path_to_your_folder/rt_fst_model.vec",
#  
#                                print_every_rows = 5000,
#  
#                                verbose = TRUE,
#  
#                                copy_data = FALSE)                  # use of external pointer
#  
#  
#  pre-processing of input data starts ...
#  File is successfully opened
#  total.number.lines.processed.input: 25000
#  creation of index starts ...
#  intersection of tokens and wordvec character strings starts ...
#  modification of indices starts ...
#  final processing of data starts ...
#  File is successfully opened
#  total.number.lines.processed.output: 25000

## ---- eval = F, echo = T-------------------------------------------------
#  
#  # res_wv = init$pre_processed_wv()
#  #
#  # str(res_wv)

## ---- eval = F, echo = T-------------------------------------------------
#  
#  doc2_sum = init$doc2vec_methods(method = "sum_sqrt", threads = 6)
#  doc2_norm = init$doc2vec_methods(method = "min_max_norm", threads = 6)
#  doc2_idf = init$doc2vec_methods(method = "idf", global_term_weights = gl_term_w, threads = 6)
#  
#  rows_cols = 1:5
#  
#  doc2_sum[rows_cols, rows_cols]
#  doc2_norm[rows_cols, rows_cols]
#  doc2_idf[rows_cols, rows_cols]
#  
#  > dim(doc2_sum)
#  [1] 10788   300
#  > dim(doc2_norm)
#  [1] 10788   300
#  > dim(doc2_idf)
#  [1] 10788   300

## ---- eval = F, echo = T-------------------------------------------------
#  
#  scal_dat = ClusterR::center_scale(doc2_sum)     # center and scale the data
#  
#  
#  opt_cl = ClusterR::Optimal_Clusters_KMeans(scal_dat, max_clusters = 15,
#                                             criterion = "distortion_fK",
#                                             fK_threshold = 0.85, num_init = 3,
#                                             max_iters = 50,
#                                             initializer = "kmeans++", tol = 1e-04,
#                                             plot_clusters = TRUE,
#                                             verbose = T, tol_optimal_init = 0.3,
#                                             seed = 1)
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  num_clust = 5
#  
#  km = ClusterR::KMeans_rcpp(scal_dat, clusters = num_clust, num_init = 3, max_iters = 50,
#                             initializer = "kmeans++", fuzzy = T, verbose = F,
#                             CENTROIDS = NULL, tol = 1e-04, tol_optimal_init = 0.3, seed = 2)
#  
#  
#  table(km$clusters)
#  
#     1    2    3    4    5
#   713 2439 2393 2607 2636
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  kmed = ClusterR::Cluster_Medoids(scal_dat, clusters = num_clust,
#                                   distance_metric = "pearson_correlation",
#                                   minkowski_p = 1, threads = 6, swap_phase = TRUE,
#                                   fuzzy = FALSE, verbose = F, seed = 1)
#  
#  
#  table(kmed$clusters)
#  
#     1    2    3    4    5
#  2396 2293 2680  875 2544
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  freq_clust = textTinyR::cluster_frequency(tokenized_list_text = clust_vec$token,
#                                            cluster_vector = km$clusters, verbose = T)
#  
#  Time difference of 0.1762383 secs
#  

## ---- eval = F, echo = T-------------------------------------------------
#  > freq_clust
#  
#  $`3`
#           WORDS COUNTS
#     1:      mln   8701
#     2:      000   6741
#     3:      cts   6260
#     4:      net   5949
#     5:     loss   4628
#    ---
#  6417:    vira>      1
#  6418:    gain>      1
#  6419:     pwj>      1
#  6420: drummond      1
#  6421: parisian      1
#  
#  $`1`
#           WORDS COUNTS
#     1:      cts   1303
#     2:   record    696
#     3:    april    669
#     4:      &lt    652
#     5: dividend    554
#    ---
#  1833:     hvt>      1
#  1834:    bang>      1
#  1835:   replac      1
#  1836:    stbk>      1
#  1837:     bic>      1
#  
#  $`4`
#           WORDS COUNTS
#      1:     mln   6137
#      2:     pct   5084
#      3:    dlrs   4024
#      4:    year   3397
#      5: billion   3390
#     ---
#  10968:   heijn      1
#  10969: "behind      1
#  10970:    myo>      1
#  10971:  "favor      1
#  10972: wonder>      1
#  
#  $`5`
#                    WORDS COUNTS
#      1:              &lt   4244
#      2:            share   3748
#      3:             dlrs   3274
#      4:          compani   3184
#      5:              mln   2659
#     ---
#  13059:        often-fat      1
#  13060: computerknowledg      1
#  13061:       fibrinolyt      1
#  13062:           hercul      1
#  13063:           ceroni      1
#  
#  $`2`
#               WORDS COUNTS
#      1:       trade   3077
#      2:        bank   2578
#      3:      market   2535
#      4:         pct   2416
#      5:        rate   2308
#     ---
#  13702:        "mfn      1
#  13703:         uk>      1
#  13704:    honolulu      1
#  13705:        arap      1
#  13706: infinitesim      1
#  
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  freq_clust_kmed = textTinyR::cluster_frequency(tokenized_list_text = clust_vec$token,
#                                                 cluster_vector = kmed$clusters, verbose = T)
#  
#  Time difference of 0.1685851 secs

