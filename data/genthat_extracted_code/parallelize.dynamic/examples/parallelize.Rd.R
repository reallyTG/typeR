library(parallelize.dynamic)


### Name: parallelize
### Title: Subject a function to dynamic parallelization
### Aliases: parallelize parallelize_call
### Keywords: ~kwd1 ~kwd2

### ** Examples

  # code to be parallelized
  parallel8 = function(e) log(1:e) %*% log(1:e);
  parallel2 = function(e) rep(e, e) %*% 1:e * 1:e;
  parallel1 = function(e) Lapply(rep(e, 15), parallel2);
  parallel0 = function() {
    r = sapply(Lapply(1:50, parallel1),
      function(e)sum(as.vector(unlist(e))));
    r0 = Lapply(1:49, parallel8);
    r
  }

  # create file that can be sourced containing function definitions
  # best practice is to define all needed functions in files that
  # can be sourced. The function tempcodefile allows to create a
  # temporary file with the defintion of given functions
  codeFile = tempcodefile(c(parallel0, parallel1, parallel2, parallel8));

  # definitions of clusters
  Parallelize_config = list(max_depth = 5, parallel_count = 24, offline = FALSE,
  backends = list(
    snow = list(localNodes = 2, splitN = 1, sourceFiles = codeFile),
    local = list(
      path = sprintf('%s/tmp/parallelize', tempdir())
    )
  ));

  # initialize
  parallelize_initialize(Parallelize_config, backend = 'local');

  # perform parallelization
  r0 = parallelize(parallel0);
  print(r0);

  # same
  r1 = parallelize_call(parallel0());
  print(r1);

  # compare with native execution
  parallelize_initialize(backend = 'off');
  r2 = parallelize(parallel0);
  print(r2);

  # put on SNOW cluster
  parallelize_initialize(Parallelize_config, backend = 'snow');
  r3 = parallelize(parallel0);
  print(r3);

  # analyse parallelization
  parallelize_initialize(Parallelize_config, backend = 'local');
  Log.setLevel(5);
  r4 = parallelize(parallel0);
  Log.setLevel(6);
  r5 = parallelize(parallel0);

  print(sprintf('All results are the same is %s', as.character(
    all(sapply(list(r0, r1, r2, r3, r4, r5), function(l)all(l == r0)))
  )));



