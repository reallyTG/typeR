## ----install_packages, message=FALSE, eval=FALSE-------------------------
#  install.packages("bioacoustics")
#  
#  # The bioacoustics package may also be installed from GitHub using devtools as follows:
#  install.packages("devtools")
#  devtools::install_github("wavx/bioacoustics") # For the latest, unstable version
#  
#  install.packages("warbleR")
#  install.packages("randomForest")

## ----load_packages, message=FALSE, eval=FALSE----------------------------
#  # Load the packages
#  library(warbleR)
#  library(bioacoustics)
#  library(tools)
#  library(randomForest)

## ----xeno1, message=FALSE, eval=FALSE------------------------------------
#  df1 = quer_xc(qword ='Catharus bicknelli type:call cnt:"United States"', download = FALSE)
#  df1 = df1[df1$Vocalization_type=="call",]
#  df1 = df1[df1$Quality=="A",]
#  df1 = df1[1:9,]

## ----xeno2, message=FALSE, results='hold', eval=FALSE--------------------
#  df2 = quer_xc(qword ='Setophaga magnolia type:song cnt:"Canada"', download = FALSE)
#  df2 = df2[df2$Quality=="A",]
#  df2 = df2[1:9,]

## ----xeno3, message=FALSE, results='hold', eval=FALSE--------------------
#  df3 = quer_xc(qword ='Passerella iliaca type:song cnt:"Canada"', download = FALSE)
#  df3 = df3[df3$Vocalization_type=="song",]
#  df3 = df3[df3$Quality %in% c("A", "B"),]
#  df3 = df3[1:9,]
#  
#  df = rbind(df1,df2,df3)
#  rm(df1,df2,df3)

## ----xeno4, eval=FALSE---------------------------------------------------
#  # Visualize your data frame
#  View(df)
#  
#  # Create data directory if not exists
#  if(!dir.exists("data"))
#    dir.create("data")
#  
#  # Download the MP3 files into your data directory
#  quer_xc(X = df, download = TRUE, path = "data")

## ----read_audio, eval=FALSE----------------------------------------------
#  CATBIC <- read_audio("data/Catharus-bicknelli-54864.mp3")
#  CATBIC

## ----spectro0, eval=FALSE------------------------------------------------
#  # Set plot margins to 0
#  par(mar = c(0, 0, 0, 0), oma = c(0, 0, 0, 0))
#  
#  # Display with spectro()
#  ticks <- c(from = 1000, to = 20000, by = 1000) # frequency tick marks from 1 to
#                                                 # 20 kHz, and steps at each 1 kHz
#  temp_slice <- c(from = 1, to = 10) # in seconds
#  spectro(CATBIC, tlim = temp_slice, FFT_size = 512, ticks_y = ticks)

## ----help, eval=FALSE----------------------------------------------------
#  # Access the arguments of the spectro function
#  ?spectro
#  ?fspec

## ----spectro1, eval=FALSE------------------------------------------------
#  # Set plot margins to 0
#  par(mar = c(0, 0, 0, 0), oma = c(0, 0, 0, 0))
#  
#  # Display the spectrogram with spectro()
#  ticks <- c(from = 1000, to = 20000, by = 1000) # frequency tick marks from 1 to
#                                                 # 20 kHz, 1 kHz steps
#  temp_slice <- c(from = 2, to = 3.5) # in seconds
#  spectro(CATBIC, tlim = temp_slice, FFT_size = 512, ticks_y = ticks)
#  
#  # fspec() gives you the spectrogram matrix with energy values (dB)
#  spec_mx <- fspec(CATBIC, tlim = temp_slice, FFT_size = 512, rotate = TRUE)
#  
#  # You can display the spectrogram with image()
#  image(spec_mx, xaxt = "n", yaxt = "n")

## ----filter, eval=FALSE--------------------------------------------------
#  temp_slice <- c(from = 2.5, to = 3.5)
#  freq_slice <- c(from = 1500, to = 20000)
#  spec_o <- fspec(CATBIC, tlim = temp_slice, flim = freq_slice, FFT_size = 512, rotate = TRUE)
#  
#  ## min and max (range) dB intensity
#  range(spec_o) # -120 (min) to 0 dB (max)
#  # Note that the tolerance of your recorders depends on the number of bits.
#  # 16-bit recorders offer only around -96 dB tolerance and sound pressure above
#  # this level is clipped to 0 dB.
#  
#  ## Let's try a filter by mean + sd intensity
#  spec_f <- fspec(CATBIC, tlim = temp_slice, flim = freq_slice, FFT_size = 512, rotate = TRUE)
#  spec_f[spec_f < mean(spec_f) + sd(spec_f)] <- -120
#  # Works well with high intensity audio events, but leads to
#  # false negatives (missed events) otherwise.
#  
#  par(mar = c(0, 0, 0, 0), oma = c(0, 0, 0, 0))
#  image(spec_o, xaxt="n", yaxt="n")
#  image(spec_f, xaxt="n", yaxt="n")

## ----threshold_help, eval=FALSE------------------------------------------
#  # Access the arguments of the threshold_detection function
#  ?threshold_detection

## ----threshold1, eval=FALSE----------------------------------------------
#  # Set each argument according to the targeted audio events
#  TD <- threshold_detection(
#    CATBIC, # Either a path to an audio file (see ?read_audio), or a Wave object
#    threshold = 12, # 12 dB SNR sensitivity for the detection algorithm
#    time_exp = 1, # Time expansion factor of 1. Only needed for bat recordings.
#    min_dur = 140, # Minimum duration threshold of 140 milliseconds (ms)
#    max_dur = 440, # Maximum duration threshold of 440 ms
#    TBE = 10, # Minimum time window between two audio events of 10 milliseconds
#    EDG = 0.996, # Temporal masking with Exponential Decay Gain from 0 to 1
#    LPF = 10000, # Low-Pass Filter of 10 kHz
#    HPF = 1000, # High-Pass Filter of 1 kHz
#    FFT_size = 256, # Size of the Fast Fourrier Transform (FFT) window
#    FFT_overlap = 0.875, # Percentage of overlap between two FFT windows
#  
#    start_thr = 25, # 25 dB threshold at the start of the audio event
#    end_thr = 30, # 30 dB threshold at the end of the audio event
#    SNR_thr = 10, # 10 dB SNR threshold at which the extraction of the audio event stops
#    angle_thr = 45, # 45° of angle at which the extraction of the audio event stops
#    duration_thr = 440, # Noise estimation is resumed after 440 ms
#    NWS = 1000, # Time window length of 1 s used for background noise estimation
#    KPE = 1e-05, # Process Error parameter of the Kalman filter (for smoothing)
#    KME = 1e-04, # Measurement Error parameter of the Kalman filter (for smoothing)
#  
#    settings = FALSE, #  Save on a list the above parameters set with this function
#    acoustic_feat = TRUE, # Extracts the acoustic and signal quality parameters
#    metadata = FALSE, # Extracts on a list the metadata embedded with the Wave file
#    spectro_dir = "./Spectros", # Directory where to save the spectrograms
#    time_scale = 1, # Time resolution of 2 ms for spectrogram display
#    ticks = TRUE # Tick marks and their intervals are drawn on the y-axis (frequencies)
#  )
#  
#  # Get the number of extracted audio events
#  nrow(TD$event_data)

## ----threshold2, eval=FALSE----------------------------------------------
#  # Let's try various settings, starting with 1024 FFT size instead of 256.
#  TD <- threshold_detection(
#    CATBIC, threshold = 12, time_exp = 1, min_dur = 140, max_dur = 440, TBE = 10,
#    EDG = 0.996, LPF = 10000, HPF = 1000, FFT_size = 1024, FFT_overlap = 0.875,
#    start_thr = 25, end_thr = 30, SNR_thr = 10, angle_thr = 45, duration_thr = 440,
#    NWS = 1000, KPE = 1e-05, KME = 1e-04, settings = FALSE, acoustic_feat = TRUE,
#    metadata = FALSE, spectro_dir = "./Spectros", time_scale = 1,
#    ticks = c(1000, 10000, 1000) # Tick marks from 1 to 10 kHz with 1 kHz interval
#  )
#  
#  # Take a look at the spectrograms and compare them with the previous extraction.
#  nrow(TD$event_data) # Only six audio events!

## ----threshold3, eval=FALSE----------------------------------------------
#  CATBIC <- read_audio("data/Catharus-bicknelli-54864.mp3")
#  TD <- threshold_detection(
#    CATBIC, threshold = 12, time_exp = 1, min_dur = 140, max_dur = 440, TBE = 10,
#    EDG = 0.996, LPF = 10000, HPF = 1000, FFT_size = 512, FFT_overlap = 0.875,
#    start_thr = 25, end_thr = 30, SNR_thr = 10, angle_thr = 125, duration_thr = 440,
#    NWS = 1000, KPE = 1e-05, KME = 1e-05, settings = FALSE, acoustic_feat = TRUE,
#    metadata = FALSE
#  )

## ----features1, eval=FALSE-----------------------------------------------
#  # Acoustic features are stored in a data frame called event_data,
#  # stored by order of detection.
#  
#  View(TD$event_data) # Contains the filename and the time of detection in the
#                      # recording, and 26 extracted features.

## ----features2, eval=FALSE-----------------------------------------------
#  # Start and end of the 5th extracted audio event (in samples)
#  c(TD$event_start[[5]], TD$event_end[[5]])
#  
#  # Remember you just have to divide by the sample rate to retrieve the time (s)
#  c(TD$event_start[[5]], TD$event_end[[5]]) / slot(CATBIC, "samp.rate")

## ----features3, eval=FALSE-----------------------------------------------
#  par(mar = c(1,1, 1, 1), oma = c(1, 1, 1, 1))
#  
#  # Amplitude track of the 5th audio event
#  plot(TD$amp_track[[5]], type = "l")
#  
#  # Frequency track of the 5th audio event
#  plot(TD$freq_track[[5]], type = "l")

## ----blob0, eval=FALSE---------------------------------------------------
#  # Access the arguments of the blob_detection function
#  ?blob_detection

## ----blob1, eval=FALSE---------------------------------------------------
#  # Use the bat recording stored in the package
#  data(myotis)
#  
#  # Set each argument according to the targeted audio events
#  BD <- blob_detection(
#    myotis, # Either a path to an audio file (see ?read_audio), or a Wave object
#    time_exp = 10, # Time expansion factor of 10 for time expanded recordings.
#    min_dur = 1.5, # Minimum duration threshold of 1.5 milliseconds (ms)
#    max_dur = 80, # Maximum duration threshold of 80 ms
#    min_area = 40, # minimum number of 40 pixels in the blob
#    TBE = 20, # Minimum time window between two audio events of 20 milliseconds
#    EDG = 0.996, # Temporal masking with Exponential Decay Gain from 0 to 1
#    LPF = slot(myotis, "samp.rate") * 10 / 2, # Low-Pass Filter at the Nyquist frequency
#    HPF = 16000, # High-Pass Filter of 16 kHz
#    FFT_size = 256, # Size of the Fast Fourrier Transform (FFT) window
#    FFT_overlap = 0.875, # Percentage of overlap between two FFT windows
#  
#    blur = 2, # Gaussian smoothing function with a factor of 2 for blurring the spectrogram
#    bg_substract = 20, # Foreground extraction with a mean filter applied on the spectrogram
#    contrast_boost = 20, # Edge contrast enhancement filter of the spectrogram contour
#  
#    settings = FALSE, #  Save on a list the above parameters set with this function
#    acoustic_feat = TRUE, # Extracts the acoustic and signal quality parameters
#    metadata = FALSE, # Extracts on a list the metadata embedded with the Wave file
#    spectro_dir = "./Spectros", # HTML page with spectrograms by order of detection
#    time_scale = 0.1, # Time resolution of 2 ms for spectrogram display
#    ticks = TRUE # Tick marks and their intervals are drawn on y-axis (frequencies)
#  )
#  
#  # Get the number of extracted audio events
#  nrow(BD$event_data)

## ----blob2, eval=FALSE---------------------------------------------------
#  # Let's try various settings, starting with 512 FFT size instead of 256.
#  BD <- blob_detection(
#    myotis, time_exp = 10, FFT_size = 512, settings = FALSE, acoustic_feat = TRUE,
#    metadata = FALSE, spectro_dir = "./Spectros", time_scale = 0.1, ticks = TRUE
#  )
#  
#  # Take a look at the spectrograms and compare them with the previous extraction.
#  nrow(BD$event_data) # Only 7 audio events!

## ----blobfeat1, eval=FALSE-----------------------------------------------
#  # Acoustic features
#  head(BD$event_data)

## ----classification0, eval=FALSE-----------------------------------------
#  # Make sure you have the right path to the 27 MP3 recordings
#  getwd()

## ----classification1, eval=FALSE-----------------------------------------
#  # Get the filepath for each MP3 file
#  files <- dir("data", recursive = TRUE, full.names = TRUE, pattern = "[.]mp3$")
#  
#  # Detect and extract audio events
#  TDs <- setNames(
#    lapply(
#      files,
#      threshold_detection,
#      threshold = 12, min_dur = 140, max_dur = 440, TBE = 50, LPF = 8000,
#      HPF = 1500, FFT_size = 512, start_thr = 30, end_thr = 20, SNR_thr = 10,
#      angle_thr = 125, duration_thr = 400, spectro_dir = NULL, NWS = 2000,
#      KPE = 0.00001, time_scale = 2, EDG = 0.996
#    ),
#    basename(file_path_sans_ext(files))
#  )
#  
#  # Keep only files with data in it
#  TDs <- TDs[lapply(TDs, length) > 0]
#  
#  # Keep the extracted feature and merge in a single data frame for further analysis
#  Event_data <- do.call("rbind", c(lapply(TDs, "[[", "event_data"), list(stringsAsFactors = FALSE)))
#  nrow(Event_data) # 355 audio events extracted
#  
#  # Compute the number of extracted CATBIC calls
#  sum(startsWith(Event_data$filename, "Cat"))
#  
#  # Add a "Class" column: "CATBIC" vs. other species of birds "OTHERS"
#  classes <- as.factor(ifelse(startsWith(Event_data$filename, "Cat"), "CATBIC", "OTHERS"))
#  Event_data <- cbind(data.frame(Class = classes), Event_data)
#  
#  # Get rid of the filename and time in the recording
#  Event_data$filename <- Event_data$starting_time <- NULL
#  

## ----classification2, eval=FALSE-----------------------------------------
#  # Split the data in 60% Training / 40% Test sets
#  train <- sample(1:nrow(Event_data), round(nrow(Event_data) * .6))
#  Train <- Event_data[train,]
#  
#  test <- setdiff(1:nrow(Event_data), train)
#  Test <- Event_data[test,]
#  
#  # Train a random forest classifier
#  set.seed(666)
#  rf <- randomForest(Class ~ duration + freq_max_amp + freq_max + freq_min +
#                             bandwidth + freq_start + freq_center + freq_end +
#                             freq_knee + fc + freq_bw_knee_fc + bin_max_amp +
#                             pc_freq_max_amp + pc_freq_max + pc_freq_min +
#                             pc_knee + temp_bw_knee_fc + slope + kalman_slope +
#                             curve_neg + curve_pos_start + curve_pos_end +
#                             mid_offset + smoothness + snr + hd + smoothness,
#                     data = Train, importance = FALSE, proximity = FALSE,
#                     replace = TRUE, ntree = 4000, mtry = 4)
#  
#  # Look at the confusion matrix of the training set
#  rf$confusion # looks good, but...
#  
#  # Let's make predictions with our classifier on a test set
#  table(Test[,1], predict(rf, Test[,-1], type = "response")) # not bad!
#  
#  # To look at the predictions
#  head(predict(rf, Test[,-1], type = "prob"))

## ----keras1, eval=FALSE--------------------------------------------------
#  # Run if keras is installed on your machine
#  
#  # Build the training set
#  Y_train <- to_categorical(as.integer(Train[,1]) - 1) # One hot encoding
#  
#  # X as matrix
#  X_train <- as.matrix(Train[,-1])
#  
#  # Build the test set
#  Y_test <- to_categorical(as.integer(Test[,1]) - 1)
#  Y_test <- Y_test[,-1]
#  X_test <- as.matrix(Test[,-1])
#  
#  # Build the sequential model
#  mod0 <- keras_model_sequential()
#  mod0 %>%
#    # Input shape layer = c(samples, rows, cols, channels)
#    layer_reshape(input_shape=ncol(X_train),target_shape=c(1,1,ncol(X_train))) %>%
#    # First conv 2d layer with 128 neurons, kernel size of 8 x 8 and stride of 1 x 1
#    layer_conv_2d(128, c(8,8), c(1,1), padding='same') %>%
#    layer_batch_normalization() %>%
#    layer_activation("relu") %>%
#    layer_dropout(0.2) %>%
#    # Second conv 2d layer with 256 neurons, kernel size of 5 x 5 and stride of 1 x 1
#    layer_conv_2d(256, c(5,5), c(1,1), padding='same') %>%
#    layer_batch_normalization() %>%
#    layer_activation("relu") %>%
#    layer_dropout(0.2) %>%
#    # Third conv 2d layer with 128 neurons, kernel size of 3 x 3 and stride of 1 x 1
#    layer_conv_2d(128, c(3,3), c(1,1), padding='same') %>%
#    layer_batch_normalization() %>%
#    layer_activation("relu") %>%
#    layer_dropout(0.2) %>%
#    # Average pooling layer
#    layer_global_average_pooling_2d() %>%
#    # Activation output layer with 2 classes
#    layer_dense(units = ncol(Y_train),  activation='softmax')
#  
#  # Model compile
#  mod0 %>% compile(loss = 'categorical_crossentropy',
#                   optimizer = "adam",
#                   metrics = "categorical_accuracy")
#  
#  
#  # Add a callback to reduce the learning rate when reaching the plateau
#  reduce_lr <- callback_reduce_lr_on_plateau(monitor = 'loss', factor = 0.5,
#                                             patience = 50, min_lr = 0.0001)
#  # Start learning
#  mod0 %>% fit(X_train, Y_train, batch_size = 32, epochs = 50,
#               validation_data = list(X_test, Y_test),
#               verbose = 1, callbacks = reduce_lr)
#  
#  # Score on the test set
#  score <- mod0 %>% evaluate(X_test, Y_test, batch_size = 32)
#  score

## ----keras2, eval=FALSE--------------------------------------------------
#  # Look at predictions and build a confusion matrix
#  Pred <- as.factor(predict_classes(mod0, X_test, batch_size = 32, verbose = 1))
#  table(Y_test[,2], Pred)
#  
#  # To look at the prediction values
#  Prob <- round(predict_proba(mod0, X_test, batch_size = 32, verbose = 1), 2)

