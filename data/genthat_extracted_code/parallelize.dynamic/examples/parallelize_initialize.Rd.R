library(parallelize.dynamic)


### Name: parallelize_initialize
### Title: Initialize dynamic parallelization of ensuing parallelize calls
### Aliases: parallelize_initialize Lapply_initialize
### Keywords: ~kwd1 ~kwd2

### ** Examples

  config = list(max_depth = 5, parallel_count = 24, offline = TRUE, backends = list(
    snow = list(
      localNodes = 1, splitN = 1, sourceFiles = c('RgenericAll.R', 'Rgenetics.R', 'RlabParallel.R')
    ),
    local = list(
      path = sprintf('%s/tmp/parallelize', tempdir())
    ),
    `ogs-1` = list(
      backend = 'OGS',
      freezerClass = 'LapplyPersistentFreezer',
      sourceFiles = c('RgenericAll.R', 'RlabParallel.R'),
      stateDir = sprintf('%s/tmp/remote', tempdir()),
      qsubOptions = sprintf('--queue all.q --logLevel %d', 2),
      doNotReschedulde = TRUE
    ),
    `ogs-2` = list(
      backend = 'OGS',
      freezerClass = 'LapplyPersistentFreezer',
      sourceFiles = c('RgenericAll.R', 'RlabParallel.R'),
      stateDir = sprintf('%s/tmp/remote', tempdir()),
      qsubOptions = sprintf('--queue subordinate.q --logLevel %d', 2),
      doSaveResult = TRUE
    ),
    `ogs-3` = list(
      backend = 'OGSremote',
      remote = 'user@localhost:tmp/remote/test',
      freezerClass = 'LapplyPersistentFreezer',
      sourceFiles = c('RgenericAll.R', 'RlabParallel.R'),
      stateDir = sprintf('%s/tmp/remote/test_local', tempdir()),
      qsubOptions = sprintf('--queue all.q --logLevel %d', 2),
      doSaveResult = TRUE
    )
  ));
  # run ensuing parallelizations locally, ignore result produced earlier
  parallelize_initialize(config, backend = "local", force_rerun = FALSE);
  # run ensuing parallelizations on the snow cluster defined in the snow backend section
  parallelize_initialize(config, backend = "local");
  # run ensuing parallelizations on a local Open Grid Scheduler
  parallelize_initialize(config, backend = "ogs-1");
  # run same analysis as above with different scheduling options
  parallelize_initialize(config, backend = "ogs-2");
  # run same analysis on a remote Opend Grid Scheduler
  # user 'user' on machine 'localhost' is used
  parallelize_initialize(config, backend = "ogs-3");



