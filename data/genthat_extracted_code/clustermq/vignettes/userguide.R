## ----echo=FALSE, results="hide"------------------------------------------
knitr::opts_chunk$set(
    cache = FALSE,
    echo = TRUE,
    collapse = TRUE,
    comment = "#>"
)
options(clustermq.scheduler = "local")
library(clustermq)

## ----eval=FALSE----------------------------------------------------------
#  # from CRAN
#  install.packages('clustermq')
#  
#  # from Github
#  # install.packages('devtools')
#  devtools::install_github('mschubert/clustermq')

## ----eval=FALSE----------------------------------------------------------
#  # install.packages('devtools')
#  devtools::install_github('mschubert/clustermq', ref="develop")

## ------------------------------------------------------------------------
fx = function(x) x * 2
Q(fx, x=1:3, n_jobs=1)

## ------------------------------------------------------------------------
fx = function(x, y) x * 2 + y
Q(fx, x=1:3, const=list(y=10), n_jobs=1)

## ------------------------------------------------------------------------
fx = function(x) x * 2 + y
Q(fx, x=1:3, export=list(y=10), n_jobs=1)

## ------------------------------------------------------------------------
fx = function(x) {
    library(dplyr)
    x %>%
        mutate(area = Sepal.Length * Sepal.Width) %>%
        head()
}
Q(fx, x=list(iris), n_jobs=1)

## ------------------------------------------------------------------------
library(foreach)
x = foreach(i=1:3) %do% sqrt(i)

## ------------------------------------------------------------------------
x = foreach(i=1:3) %dopar% sqrt(i)

## ------------------------------------------------------------------------
clustermq::register_dopar_cmq(n_jobs=2, memory=1024) # this accepts same arguments as `Q`
x = foreach(i=1:3) %dopar% sqrt(i) # this will be executed as jobs

## ----eval=FALSE----------------------------------------------------------
#  library(drake)
#  load_mtcars_example()
#  # clean(destroy = TRUE)
#  # options(clustermq.scheduler = "multicore")
#  make(my_plan, parallelism = "clustermq", jobs = 2, verbose = 4)

## ----eval=FALSE----------------------------------------------------------
#  Q(..., log_file="/path/to.file")

## ----eval=FALSE----------------------------------------------------------
#  options(clustermq.ssh.log = "~/ssh_proxy.log")

## ----eval=FALSE----------------------------------------------------------
#  options(
#      clustermq.scheduler = "lsf",
#      clustermq.template = "/path/to/file/below"
#  )

## ----eval=FALSE----------------------------------------------------------
#  #BSUB-J {{ job_name }}[1-{{ n_jobs }}]  # name of the job / array jobs
#  #BSUB-o {{ log_file | /dev/null }}      # stdout + stderr; %I for array index
#  #BSUB-M {{ memory | 4096 }}             # Memory requirements in Mbytes
#  #BSUB-R rusage[mem={{ memory | 4096 }}] # Memory requirements in Mbytes
#  ##BSUB-q default                        # name of the queue (uncomment)
#  ##BSUB-W {{ walltime | 6:00 }}          # walltime (uncomment)
#  
#  ulimit -v $(( 1024 * {{ memory | 4096 }} ))
#  R --no-save --no-restore -e 'clustermq:::worker("{{ master }}")'

## ----eval=FALSE----------------------------------------------------------
#  options(
#      clustermq.scheduler = "sge",
#      clustermq.template = "/path/to/file/below"
#  )

## ----eval=FALSE----------------------------------------------------------
#  #$ -N {{ job_name }}               # job name
#  #$ -q default                      # submit to queue named "default"
#  #$ -j y                            # combine stdout/error in one file
#  #$ -o {{ log_file | /dev/null }}   # output file
#  #$ -cwd                            # use pwd as work dir
#  #$ -V                              # use environment variable
#  #$ -t 1-{{ n_jobs }}               # submit jobs as array
#  
#  ulimit -v $(( 1024 * {{ memory | 4096 }} ))
#  R --no-save --no-restore -e 'clustermq:::worker("{{ master }}")'

## ----eval=FALSE----------------------------------------------------------
#  options(
#      clustermq.scheduler = "slurm",
#      clustermq.template = "/path/to/file/below"
#  )

## ----eval=FALSE----------------------------------------------------------
#  #!/bin/sh
#  #SBATCH --job-name={{ job_name }}
#  #SBATCH --partition=default
#  #SBATCH --output={{ log_file | /dev/null }} # you can add .%a for array index
#  #SBATCH --error={{ log_file | /dev/null }}
#  #SBATCH --mem-per-cpu={{ memory | 4096 }}
#  #SBATCH --array=1-{{ n_jobs }}
#  
#  ulimit -v $(( 1024 * {{ memory | 4096 }} ))
#  R --no-save --no-restore -e 'clustermq:::worker("{{ master }}")'

## ----eval=FALSE----------------------------------------------------------
#  options(
#      clustermq.scheduler = "sge",
#      clustermq.template.lsf = "/path/to/file/below"
#  )

## ----eval=FALSE----------------------------------------------------------
#  #PBS -N {{ job_name }}
#  #PBS -l select=1:ncpus={{ cores | 1 }}
#  #PBS -l walltime={{ walltime | 1:00:00 }}
#  #PBS -q default
#  #PBS -o {{ log_file | /dev/null }}
#  #PBS -j oe
#  
#  ulimit -v $(( 1024 * {{ memory | 4096 }} ))
#  R --no-save --no-restore -e 'clustermq:::worker("{{ master }}")'

## ----eval=FALSE----------------------------------------------------------
#  options(
#      clustermq.scheduler = "sge",
#      clustermq.template.lsf = "/path/to/file/below"
#  )

## ----eval=FALSE----------------------------------------------------------
#  #PBS -N {{ job_name }}
#  #PBS -l nodes={{ n_jobs }}:ppn=1,walltime={{ walltime | 30:00 }}
#  #PBS -o {{ log_file | /dev/null }}
#  #PBS -q default
#  #PBS -j oe
#  
#  ulimit -v $(( 1024 * {{ memory | 4096 }} ))
#  R --no-save --no-restore -e 'clustermq:::worker("{{ master }}")'

