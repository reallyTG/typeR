library(GRANCore)


### Name: logfile
### Title: Log file location of a GRAN (sub) repository
### Aliases: logfile logfile-method,GRANRepository
###   logfile,GRANRepository-method logfile,RepoBuildParam-method
###   dep_repos,GRANRepository-method dep_repos,RepoBuildParam repo_name
###   repo_name,GRANRepository-method repo_name,GRANRepository temp_repo
###   temp_repo,GRANRepository-method temp_repo,GRANRepository
###   check_warn_ok check_warn_ok,GRANRepository-method
###   check_warn_ok,GRANRepository check_note_ok
###   check_note_ok,GRANRepository-method check_note_ok,GRANRepository
###   suspended_pkgs suspended_pkgs,GRANRepository-method
###   suspended_pkgs,GRANRepository suspended_pkgs<-
###   suspended_pkgs<-,GRANRepository-method
###   suspended_pkgs<-,GRANRepository sh_init_script,GRANRepository-method
###   sh_init_script,GRANRepository sh_init_script<-,GRANRepository-method
###   sh_init_script<-,GRANRepository extra_fun
###   extra_fun,GRANRepository-method check_test_on
###   check_test_on,RepoBuildParam-method check_test_on,RepoBuildParam
###   check_test_on,GRANRepository-method check_test_on,GRANRepository
###   install_test_on install_test_on,RepoBuildParam-method
###   install_test_on,RepoBuildParam install_test_on,GRANRepository-method
###   install_test_on,GRANRepository logfun,GRANRepository-method
###   logfun,GRANRepository logfun<-,GRANRepository-method
###   logfun<-,GRANRepository use_cran_granbase use_cran_granbase<-
###   use_cran_granbase,GRANRepository-method
###   use_cran_granbase,GRANRepository
###   use_cran_granbase<-,GRANRepository-method
###   use_cran_granbase<-,GRANRepository
###   use_cran_granbase,RepoBuildParam-method
###   use_cran_granbase,RepoBuildParam
###   use_cran_granbase<-,RepoBuildParam-method
###   use_cran_granbase<-,RepoBuildParam check_timeout check_timeout<-
###   check_timeout,GRANRepository-method check_timeout,GRANRepository
###   check_timeout<-,GRANRepository-method check_timeout<-,GRANRepository
###   check_timeout,RepoBuildParam-method check_timeout,RepoBuildParam
###   check_timeout<-,RepoBuildParam-method check_timeout<-,RepoBuildParam
###   build_timeout build_timeout<- build_timeout,GRANRepository-method
###   build_timeout,GRANRepository build_timeout<-,GRANRepository-method
###   build_timeout<-,GRANRepository build_timeout,RepoBuildParam-method
###   build_timeout,RepoBuildParam build_timeout<-,RepoBuildParam-method
###   build_timeout<-,RepoBuildParam pkg_log_dir
###   pkg_log_dir,RepoBuildParam-method pkg_log_dir,RepoBuildParam
###   pkg_log_dir,GRANRepository-method pkg_log_dir,GRANRepository
###   pkg_log_file pkg_log_file,ANY,RepoBuildParam-method
###   pkg_log_file,RepoBuildParam pkg_log_file,ANY,GRANRepository-method
###   pkg_log_file,GRANRepository

### ** Examples

repo = GRANRepository(GithubManifest("gmbecker/fastdigest"), basedir = tempdir())
# parameter object
param(repo)
##fundamental sub-objects
manifest(repo)
repo_results(repo)
##important directories
repobase(repo)
staging(repo)
temp_lib(repo)
notrack(repo)
destination(repo)
dest_base(repo)
windowsbindir(repo)
archivedir(repo)
metadatadir(repo)
check_result_dir(repo)
backup_archive(repo)
coverage_report_dir(repo)
pkg_doc_dir(repo)
install_result_dir(repo)
repo_url(repo)
checkout_dir(repo)
## logging
logfile(repo)
errlogfile(repo)
staging_logs(repo)
pkg_log_dir(repo)
pkg_log_file("switchr", repo)
## email and other behavior
email_options(repo)
email_notify(repo)
## miscellaneous
make_windows_bins(repo)
use_cran_granbase(repo)
check_timeout(repo)
build_timeout(repo)




